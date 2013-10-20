/*
  The EdLoop

  This code controls a programmable true bypass looper.

  It was written for the Arduino UNO Rev 3 on 64bit Ubuntu 12.04.
  

  Hardware I/O Controlled
  =======================
  * 16 momentary input switches
  * 10 relays for the effect loops
  * 2 relays for amp control
  * 2 relays for output
  * 10 LEDs to indicate the current preset
  * 1 RGB LED to indicate mode
  * 1 7 segment display to indicate the bank
  * 1 mini dip switch for configuration


  MCP23017 Expanders
  ==================
  The switch and relay expanders are aligned so the switch data can directly
  set or toggle the relays. The MODE and BANK states are ignored on the Relay
  MCP. Those two pins are unused.
  
  * Physical Switch Layout
    OUT2  CTL2  LP6  LP7  LP8  LP9  LP10  MODE
    OUT1  CTL1  LP1  LP2  LP3  LP4  LP5   BANK
  * MCP Alignment
    +---------------------- MODE Switch State
    |+--------------------- BANK    ""
    ||+-------------------- LP10    "" 
    |||    +---------------  LP5    ""
    |||    | +-------------  LP4    ""
    |||    | |      +------ OUT1    ""
    |||    | |      |
    00000000 00000000 Input MCP bits (Port B GPB7-GPB0, Port A GPA7-GPA0)
    |||||||| ||||||||
    00000000 00000000 Relay MCP bits 
    |||    | |      |
    |||    | |      +------ OUT1 Relay State
    |||    | +-------------  LP4  ""
    |||    +---------------  LP5  ""
    ||+-------------------- LP10  ""
    |+---------------------   NC
    +----------------------   NC
      
  * Switches
    I2C Address: 0x20
    +-----------------------+-----------------------+
    |        Port A         |        Port B         |
    |----------+------------+----------+------------+
    | Name:Pin | Bus Name   | Name:Pin | Bus Name   |
    |----------+------------+----------+------------|
    | GPA0:21  | OUT1_SW    | GPB0:1   | LP5_SW     |
    | GPA1:22  | OUT2_SW    | GPB1:2   | LP6_SW     |
    | GPA2:23  | CTL1_SW    | GPB2:3   | LP7_SW     |
    | GPA3:24  | CTL2_SW    | GPB3:4   | LP8_SW     |
    | GPA4:25  | LP1_SW     | GPB4:5   | LP9_SW     |
    | GPA5:26  | LP2_SW     | GPB5:6   | LP10_SW    |
    | GPA7:27  | LP3_SW     | GPB6:7   | BANK_SW    |
    | GPA7:28  | LP4_SW     | GPB7:8   | MODE_SW    |
    +----------+------------+----------+------------+
  * Relays
    I2C Address: 0x21
    +-----------------------+-----------------------+
    |        Port A         |        Port B         |
    |----------+------------+----------+------------+
    | Name:Pin | Bus Name   | Name:Pin | Bus Name   |
    |----------+------------+----------+------------|
    | GPA0:21  | OUT1_RELAY | GPB0:1   | LP5_RELAY  |
    | GPA1:22  | OUT2_RELAY | GPB1:2   | LP6_RELAY  |
    | GPA2:23  | CTL1_RELAY | GPB2:3   | LP7_RELAY  |
    | GPA3:24  | CTL2_RELAY | GPB3:4   | LP8_RELAY  |
    | GPA4:25  | LP1_RELAY  | GPB4:5   | LP9_RELAY  |
    | GPA5:26  | LP2_RELAY  | GPB5:6   | LP10_RELAY |
    | GPA7:27  | LP3_RELAY  | GPB6:7   | NC         |
    | GPA7:28  | LP4_RELAY  | GPB7:8   | NC         |
    +----------+------------+----------+------------+
  * Status LEDs
    I2C Address: 0x22
    +-----------------------+-----------------------+
    |        Port A         |        Port B         |
    |----------+------------+----------+------------+
    | Name:Pin | Bus Name   | Name:Pin | Bus Name   |
    |----------+------------+----------+------------|
    | GPA0:21  | PSET1_LED  | GPB0:1   | PSET9_LED  |
    | GPA1:22  | PSET2_LED  | GPB1:2   | PSET10_LED |
    | GPA2:23  | PSET3_LED  | GPB2:3   | MODE_R_LED |
    | GPA3:24  | PSET4_LED  | GPB3:4   | MODE_G_LED |
    | GPA4:25  | PSET5_LED  | GPB4:5   | MODE_B_LED |
    | GPA5:26  | PSET6_LED  | GPB5:6   | NC         |
    | GPA7:27  | PSET7_LED  | GPB6:7   | NC         |
    | GPA7:28  | PSET8_LED  | GPB7:8   | NC         |
    +----------+------------+----------+------------+


  Seven Segment Display and Config Mini DIP Switches
  ==================================================
  These are accessed directly through ATMega328p I/O pins. Common Cathode or
  Common Annode can be used. See: update7Seg().

  Internal pull-up resistors are used to bias the DIP switches. Switch ON
  pulls each bit directly to ground. So the DIP input is inverted. The switch
  is read each time BANK is stomped or when the mode transisitons from Manual
  to Program.

  +-------------------------------+--------------------------------+
  |            7 Seg              |               DIP              |
  |---------+----------+----------+----------+----------+----------+
  | Uno PIN | 328p Pin | Bus Name | Uno Pin  | 328p Pin | Bus Name |
  |---------+----------+----------+----------+----------+----------+
  | 11	    |  17      |  7SEG_A  | 7	     | 13     	| DIP1     |
  | 12	    |  18      |  7SEG_B  | 8	     | 14     	| DIP2     |
  | 13	    |  19      |  7SEG_C  | 9	     | 15     	| DIP3     |
  | A0	    |  23      |  7SEG_D  | 10	     | 16     	| DIP4     |
  | A1	    |  24      |  7SEG_E  |          |          |          |
  | A2	    |  25      |  7SEG_F  |          |          |          |
  | A3	    |  26      |  7SEG_G  |          |          |          |
  +---------+----------+----------+----------+----------+----------+


  EEPROM layout
  =============
  Preset memory starts at 0x0000. Each preset takes 2 bytes of storage. MSB
  first. 1 bit per relay. Contact closed = 1.
  
  +--------------------- preset start addr       (MSB)
  |          +---------- preset start addr + 1   (LSB)
  |          |
  0000 0000  0000 0000
  |||                |
  |||                +-- Relay  1 state (OUT1)
  |||                    ...
  ||+------------------  Relay 14 state (LP10)
  ||
  ++-------------------  Not used

  8 banks can be utilized. 8 x 10 preset switchess gives 80 possible presets
  so the last preset, bank 8 preset 10, is @ 0x00a0

  NOTE: If the bits were packed it would save 40 bytes of ROM. This would
        require a little more code but there is plenty of program space
	remaining in the 328p.

  Another byte is needed to determine if this is the first boot of the system.
  This is @ 0x00a2. If the value is not 0x00 this is the first boot. The
  preset memory locations will be initialized to 0x00 (all relays off).  0x00
  will then be written to 0x00a2 for subsequent boots.

  
  Further Development
  ===================
  With the above design there are 7 unused pins on the 328p.
  
  1. Add a config DIP switch to modify BANK switch behavior.
     a. 7seg increments and flashes if bank is out of sync (current behavior)
     b. 7seg increments. The preset from that bank is immediately loaded.
        So if bank 1, preset 1 is active and bank is stomped, bank 2, preset
	1 is loaded.
  2. Add Bluetooth to load/save presets to EEPROM.
     This would open up a whole can of worms. I could write an Android app
     to create/manage presets then upload them to the looper. My phone could
     then act as a GUI for the looper.
  3. Possibly cut the Arduino umbilical. Wire.h and EEPROM.h
  4. Add a scroll-able read-only alphanumeric display for all presets. This
     would take much more memory.
     * 16 characters * 80 presets = 1280 bytes max.
     * Plus 160 bytes for relay state = 1440 bytes max.
     * 328p has 1KB of ROM and 2KB of RAM
       +-- bank
       |+- preset
       vv
     +------------------+  
     | 11 Liberace      | O UP
     | 12 Boy George    |
     | 13 Deathmatch!   |
     | 14 BridgeOfSighs | O DOWN
     +------------------+
     Phone GUI would work too though.
   5. Add a tap-tempo switch that would be valid in MANUAL or PROGRAM modes.
      * MANUAL mode
        Send the tempo directly to a jack.
      * PROGRAM mode
        Start with the tap interval initialized to 0.  Scan the tempo
        momentary switch (possibly use an interrupt?) storing the interval of
        the last two taps. When the user selects a preset switch, store the
        interval with the relay states. When that preset is later recalled,
        send two pulses to the tap tempo jack based on the associated
        interval. If an unsigned long was used to store the interval, per
        preset, it would require another 320 bytes of ROM.
	
      How accurate would this be? And, where -- physically -- am I going to
      put the extra switch? CTL1/2 and OUT1/2 are ignored in Preset and
      Program mode. One of these could possibly double as a tap tempo switch
      in these modes but adjusting the tempo in Manual mode would probably be
      more intuative.
*/

#include <EEPROM.h>
#include <Wire.h>
#include "mcp23017.h"

/*                                                      R E S E T  R O M
							
  If defined, the first 160 bytes of EEPROM will be set to 0x00 at boot. This
  will effectively erase any presets stored. This is for development only. The
  boot flag is set as well.
*/
// #define RESET_ROM

/*                                                      D E B U G  M E
  
  If defined, write debug info using Serial.print...
  Uses approximately 8% of program space, and 28% of data space.
*/
// #define DEBUG_ME

// 0x0 will be written here after first boot
#define BOOT_FLAG_ADDR 0xa2

// MCP23017 expander addresses
#define SWITCH_MCP_ADDR      0x20
#define RELAY_MCP_ADDR       0x21
#define LED_MCP_ADDR         0x22

// Time in ms to wait until the bank display
// or preset leds are toggled on or off
#define FLASH_WAIT_TIME 250

// The maximum number of presets that can be stored in EEPROM.
// 10 LP switches * 8 banks
#define MAX_PRESETS 80

// int to 7 seg character map, segMap[0]=0, segMap[15]=F
const uint8_t segMap[] = {
    0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07,
    0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71
};

// 7 seg pins          a   b   c   d   e   f   g
const int segPins[] = {11, 12, 13, A0, A1, A2, A3};

// config DIP pins
//                     +-------------- write protect
//                     |  +----------- bank limit bit 3
//                     |  |  +--------       ""       2
//                     |  |  |  +-----       ""       1
//                     v  v  v  v
const int dipPins[] = {7, 8, 9, 10};

// switch masks
#define SW_BANK 0b0100000000000000
#define SW_MODE 0b1000000000000000
// any LP switch press mask for Preset and Program mode
#define SW_ANY_LP    0b0011111111110000
// any relay switch for Manual mode
#define SW_ANY_RELAY 0b0011111111111111

// 6 samples, one every 5ms, approximately.
// This ensures the switch has been in a stable state for approximately 30ms.
#define MAX_SAMPLES 6
unsigned long debounceTime = 5;

// System modes
#define PRESET_MODE 0
#define MANUAL_MODE 1
#define PROGRAM_MODE 2

// current mode
int curMode = PRESET_MODE;

#ifdef DEBUG_ME
// indexed with curMode
const char* modeStringMap[] = {
    "Preset Mode", "Manual Mode", "Program Mode",
};
#endif

// Preset relay states, copied from EEPROM at boot for fast access.
// When a user stores a preset it will be written here and to ROM.
uint16_t presetCache[MAX_PRESETS] = {0};

// The value currently displayed in the 7 seg display will be one more than
// this. This may or may not be different from the value stored in
// activePreset.bank.
int curBank = 0;
// true if curBank does not match activePreset.bank.
// This may happen when the user increments the bank in Preset mode.
// It's used primarily to flag if the bank display should be flashed.
bool bankOutOfSync = false;

// preset data
typedef struct {
    int bank;			// [0, 7]
    int offset;			// [0, 9]
} preset_t;
// boot preset will always be bank 0, preset 0
// TODO: Write this to ROM each time it's changed. That way the last used
//       preset could be loaded at boot. Is EEPROM write latency going to
//       noticably effect switch operation?
preset_t activePreset = {0, 0};

/*
  Read DIP switches 2, 3, and 4, return the integer [1, 8].
  Called when the BANK switch is stomped.
*/
int readMaxBank() {
    int result = 
	!digitalRead(dipPins[1]) * 4
	+ !digitalRead(dipPins[2]) * 2
	+ !digitalRead(dipPins[3])
	+ 1;
#ifdef DEBUG_ME
    Serial.print("\nMax Banks: ");
    Serial.println(result);
#endif
    return result;
}

/*
  Read the write protect DIP switch, return true or false.
  Called every time an attempt is made to enter Program mode.
*/
boolean readWriteProtected() {
    int result = digitalRead(dipPins[0]);
#ifdef DEBUG_ME
    Serial.print("\nWrite Protect: ");
    Serial.println(result ? "OFF" : "ON");
#endif    
    return result ? false : true;
}

// Display value in the seven segment display.
// Set value = -1 to blank the display.
// cc is common cathode, set false for common annode.
void update7Seg(int value, boolean cc=true) {
    int i = 0;
    // blank it for flashing
    if (value == -1) {
	for (; i<7; i++)
	    digitalWrite(segPins[i], cc ? LOW : HIGH);
    }
    // update
    else {
	uint8_t hexValue = cc ? segMap[value] : ~segMap[value];
	for (i=0; i<7; i++)
	    digitalWrite(segPins[i], (hexValue & 1 << i) ? HIGH : LOW);
    }
#ifdef DEBUG_ME
    Serial.print("\n7seg Updated: ");
    if (value == -1)
	Serial.println("OFF");
    else
	Serial.println(value);
#endif    
}

/***************************************************************************
  Relay code
*/

// #define MUTE_PIN 2     // 328p pin: PD2, pin 4
#define RELAY_ALL_OFF  0b0000000000000000

// shadow the MCP state
uint16_t lastRelayMCPWrite = RELAY_ALL_OFF;

/*
  Called when:
  1. LP1/10 is stomped in Preset mode
  2. OUT1/2, CTL1/2, LP1/10 is stomped in Manual mode
  
  If toggle is true, flip the relays that have their bit set, else write bits
  as-is. The former is used in Manual mode, the latter when loading a preset.

  TODO: mute
*/
void updateRelays(uint16_t bits, boolean toggle=true) {
    /* digitalWrite(MUTE_PIN, HIGH); */
    if (toggle)
	lastRelayMCPWrite ^= bits;
    else
	lastRelayMCPWrite = bits;
    Wire.beginTransmission(RELAY_MCP_ADDR);
    Wire.write((byte)GPIOA);
    Wire.write((byte)lastRelayMCPWrite);	// LSB
    Wire.write((byte)(lastRelayMCPWrite >> 8)); // MSB
    Wire.endTransmission();
    /* digitalWrite(MUTE_PIN, LOW); */
#ifdef DEBUG_ME
    Serial.println("\nRelays Updated: ");
    Serial.println("OUT1 OUT2 CTL1 CTL2  LP1  LP2  LP3  LP4  LP5  LP6  LP7\
  LP8  LP9 LP10");
    for (int i=0; i<14; i++) {
	if (i > 0)
	    Serial.print(" ");
	Serial.print((lastRelayMCPWrite & (1 << i)) ? "  ON" : "    ");
    }
    Serial.println("");
#endif
}

/***********************************************************************
  Preset and Mode LED code
*/

//                           +++--------------- not used
//                           |||+++------------ mode RGB LED
//                           vvvvvv
#define PRESET_LED_1_ON    0b0000000000000001
#define PRESET_LED_2_ON    0b0000000000000010
#define PRESET_LED_3_ON    0b0000000000000100
#define PRESET_LED_4_ON    0b0000000000001000
#define PRESET_LED_5_ON    0b0000000000010000
#define PRESET_LED_6_ON    0b0000000000100000
#define PRESET_LED_7_ON    0b0000000001000000
#define PRESET_LED_8_ON    0b0000000010000000
#define PRESET_LED_9_ON    0b0000000100000000
#define PRESET_LED_10_ON   0b0000001000000000
#define PRESET_LED_ALL_ON  0b0000001111111111 // for
#define PRESET_LED_ALL_OFF 0b0000000000000000 // flashing
#define PRESET_LED_MASK    PRESET_LED_ALL_ON

// indexed by activePreset.offset
uint16_t presetLEDMap[] = {
    PRESET_LED_1_ON,
    PRESET_LED_2_ON,
    PRESET_LED_3_ON,
    PRESET_LED_4_ON,
    PRESET_LED_5_ON,
    PRESET_LED_6_ON,
    PRESET_LED_7_ON,
    PRESET_LED_8_ON,
    PRESET_LED_9_ON,
    PRESET_LED_10_ON,
};

#ifdef DEBUG_ME
#define MODE_LED_RED_MASK   0b0000010000000000
#define MODE_LED_GREEN_MASK 0b0000100000000000
#define MODE_LED_BLUE_MASK  0b0001000000000000
#endif

// for common cathode RGB LED
//                               +-------------- Blue
//                               |+------------- Green
//                               ||+------------ Red
//                               vvv
#define MODE_LED_RED_ON     0b0000010000000000
#define MODE_LED_GREEN_ON   0b0000100000000000
#define MODE_LED_BLUE_ON    0b0001000000000000
#define MODE_LED_YELLOW_ON  0b0000110000000000
#define MODE_LED_MAGENTA_ON 0b0001010000000000
#define MODE_LED_CYAN_ON    0b0001100000000000
#define MODE_LED_WHITE_ON   0b0001110000000000
#define MODE_LED_OFF        0b0000000000000000
#define MODE_LED_MASK       MODE_LED_WHITE_ON

// Change the Mode LED color here.
// Indexed with curMode.
uint16_t modeLEDMap[] = {
    MODE_LED_BLUE_ON,		// PRESET_MODE
    MODE_LED_RED_ON,		// MANUAL_MODE
    MODE_LED_YELLOW_ON,		// PROGRAM_MODE
};

// shadow the MCP state
uint16_t lastLEDMCPWrite = MODE_LED_OFF;

/*
  Called when the MODE switch is stomped
 */
void updateModeLED(uint16_t bits) {
    // Turn all mode bits off, leaving preset bits as they are.
    // Then set mode LED bits. 
    lastLEDMCPWrite = (lastLEDMCPWrite & PRESET_LED_MASK) | bits;
    Wire.beginTransmission(LED_MCP_ADDR);
    Wire.write((byte)GPIOA);
    Wire.write((byte)lastLEDMCPWrite);
    Wire.write((byte)(lastLEDMCPWrite >> 8));
    Wire.endTransmission();
#ifdef DEBUG_ME
    Serial.println("\nMode LED Updated: ");
    Serial.println("Red  Green  Blue");
    Serial.print((lastLEDMCPWrite & MODE_LED_RED_MASK)
		 ? " ON"
		 : "   ");
    Serial.print((lastLEDMCPWrite & MODE_LED_GREEN_MASK)
		 ? "     ON"
		 : "       ");
    Serial.print((lastLEDMCPWrite & MODE_LED_BLUE_MASK)
		 ? "    ON"
		 : "      ");
    Serial.println("");
#endif
}

/*
  Called when ...
 */
void updatePresetLED(uint16_t bits) {
    // Turn all preset LED bits off, leaving mode bits as they are.
    // Then set preset LED bits. 
    lastLEDMCPWrite = (lastLEDMCPWrite & MODE_LED_MASK) | bits;
    Wire.beginTransmission(LED_MCP_ADDR);
    Wire.write((byte)GPIOA);
    Wire.write((byte)lastLEDMCPWrite);
    Wire.write((byte)(lastLEDMCPWrite >> 8));
    Wire.endTransmission();
#ifdef DEBUG_ME
    Serial.println("\nPreset LED(s) Updated: ");
    Serial.println("LP1  LP2  LP3  LP4  LP5  LP6  LP7  LP8  LP9 LP10");
    for (int i=0; i<10; i++) {
	if (i > 0)
	    Serial.print("  ");
	Serial.print((lastLEDMCPWrite & (1 << i))
		     ? " ON"
		     : "   ");
    }
    Serial.println("");
#endif
}

/***********************************************************************
  Initialization code
*/

void initSwitchMCP() {
    // set the expander to automatically increment the address pointer
    Wire.beginTransmission(SWITCH_MCP_ADDR);
    Wire.write((byte)IOCON);
    Wire.write((byte)0x20);
    Wire.endTransmission();
    // set port A/B to input
    Wire.beginTransmission(SWITCH_MCP_ADDR);
    Wire.write((byte)IODIRA);
    Wire.write((byte)0xff);
    Wire.write((byte)0xff);	// address pointer automatically incremented
    Wire.endTransmission();
    // invert the polarity on port A/B
    Wire.beginTransmission(SWITCH_MCP_ADDR);
    Wire.write((byte)IPOLA);
    Wire.write((byte)0xff);
    Wire.write((byte)0xff);
    Wire.endTransmission();
    // enable pull up resistors on port A/B
    Wire.beginTransmission(SWITCH_MCP_ADDR);
    Wire.write((byte)GPPUA);
    Wire.write((byte)0xff);
    Wire.write((byte)0xff);
    Wire.endTransmission();
}

void initRelayMCP() {
    // set the expander to automatically increment the address pointer
    Wire.beginTransmission(RELAY_MCP_ADDR);
    Wire.write((byte)IOCON);
    Wire.write((byte)0x20);
    Wire.endTransmission();
    // set port A/B to output
    Wire.beginTransmission(RELAY_MCP_ADDR);
    Wire.write((byte)IODIRA);
    Wire.write((byte)0x00);
    Wire.write((byte)0x00);
    Wire.endTransmission();
    // all relays off at boot
    updateRelays(RELAY_ALL_OFF, false);
}

void initLEDMCP() {
    // set the expander to automatically increment the address pointer
    Wire.beginTransmission(LED_MCP_ADDR);
    Wire.write((byte)IOCON);
    Wire.write((byte)0x20);
    Wire.endTransmission();
    // set port A/B to output
    Wire.beginTransmission(LED_MCP_ADDR);
    Wire.write((byte)IODIRA);
    Wire.write((byte)0x00);
    Wire.write((byte)0x00);
    Wire.endTransmission();
    // set the mode LED and turn LP1 LED on
    updateModeLED(modeLEDMap[PRESET_MODE]);
    updatePresetLED(presetLEDMap[0]);
}

// Port and expander setup
void initIO() {
    initSwitchMCP();
    initRelayMCP();
    initLEDMCP();
    // 328p I/O pins
    int i = 0;
    for (; i<8; i++)
	pinMode(segPins[i], OUTPUT);
    for (i=0; i<4; i++) {
	pinMode(dipPins[i], INPUT);
	// enable pull-up resistors
	digitalWrite(dipPins[i], HIGH);
    }
}

/*************************************************************************
  EEPROM
*/

#ifdef RESET_ROM
// initialize the ROM (for dev)
void resetROM() {
    for (int i=0; i<BOOT_FLAG_ADDR; i++)
	EEPROM.write(i, 0x00);
    EEPROM.write(BOOT_FLAG_ADDR, 0);
}
#endif

// Initialize the preset EEPROM or copy it to RAM.
// Two bytes per preset.
void initPresets() {
    int i, j;
    // first boot, initialize the EEPROM, save the boot flag
    if (EEPROM.read(BOOT_FLAG_ADDR) == 0xff) {
	for (i=0; i<BOOT_FLAG_ADDR; i++)
	    EEPROM.write(i, 0x00);
	EEPROM.write(BOOT_FLAG_ADDR, 0);
    }
    // subsequent boot
    else {
	uint16_t preset = 0;
	// transfer the presets to RAM for fast reads
	for (i=0,j=0; i<MAX_PRESETS*2; i+=2, j++) {
	    preset = EEPROM.read(i) << 8;
	    preset |= EEPROM.read(i+1);
	    presetCache[j] = preset;
	}
    }
}

/**************************************************************************
  Logic code
*/

/*
  Load the value of activePreset.

  Set the relay state, one preset LED, and the bank display.

  This happens:
  1. At boot-up
  2. In Preset Mode when LP1/10 is pressed
  3. In Manual Mode when write-protect is enabled and the Mode switch is
     pressed
  4. In Program Mode when the Mode switch is pressed
*/
void loadCurPreset() {
    int idx = activePreset.bank * 10 + activePreset.offset;
    // false means write the bits as-is instead of
    // toggling the relays that have their bit set as in Manual mode
    updateRelays(presetCache[idx], false);
    updatePresetLED(presetLEDMap[activePreset.offset]);
    curBank = activePreset.bank;
    update7Seg(curBank + 1);
    // stop the bank flashing
    bankOutOfSync = false;
#ifdef DEBUG_ME
    Serial.print("\nLoaded Preset: bank=");
    Serial.print(activePreset.bank + 1);
    Serial.print(" preset=");
    Serial.println(activePreset.offset + 1);
#endif
}

/*
  Write the current state of the relays to EEPROM and presetCache.
  Called in Program mode when one of LP1/10 is stomped to save a preset.
  lpSwitches holds the bits, left to right, LP10 through LP1.
  If multiple bits are set (e.g. the user stomped two LP switches
  simultaneously) the first one encountered, right to left, wins.
 */
void savePreset(uint16_t lpSwitches) {
    activePreset.bank = curBank;
    for (int i=0; i<10; i++) {
	if (1 << i & lpSwitches) {
	    int cacheIdx = curBank * 10 + i;
	    activePreset.offset = i;
	    // save preset to the cache
	    presetCache[cacheIdx] = lastRelayMCPWrite;
	    // and to EEPROM
	    EEPROM.write(cacheIdx * 2, (byte)(lastRelayMCPWrite >> 8)); // MSB
	    EEPROM.write(cacheIdx * 2 + 1, (byte)lastRelayMCPWrite);	// LSB
	    bankOutOfSync = false;
	    updatePresetLED(presetLEDMap[activePreset.offset]);
	    break;
	}
    }
}

/*
  Called when LP1/10 is stomped in Preset mode.
  lpSwitches holds the bits, left to right, LP10 through LP1.
  If multiple bits are set, the first one encountered, right to left, wins.
 */
void loadPreset(uint16_t lpSwitches) {
    for (int i=0; i<10; i++) {
	if (1<<i & lpSwitches) {
	    activePreset.bank = curBank;
	    activePreset.offset = i;
	    loadCurPreset();
	    break;
	}
    }
}

/*
  Called when BANK is stomped in Preset or Program mode.
 */
void nextBank() {
    curBank = (curBank + 1) % readMaxBank();
    update7Seg(curBank + 1);
    bankOutOfSync = activePreset.bank != curBank;
}

/*
  Mode transition.
  Called when MODE is stomped.
*/
void nextMode() {
    // PRESET => MANUAL
    if (curMode == PRESET_MODE) {
	// re-sync the bank display
	if (bankOutOfSync) {
	    curBank = activePreset.bank;
	    bankOutOfSync = false;
	    update7Seg(curBank + 1);
	}
	curMode = MANUAL_MODE;
    }
    // MANUAL => PROGRAM or PRESET
    else if (curMode == MANUAL_MODE) {
	// cycle back to Preset mode if write protected
	if (readWriteProtected()) {
	    loadCurPreset();
	    curMode = PRESET_MODE;
	}
	// move on to Program mode
	else
	    // NOTE: bankOutOfSync was corrected in the previous Manual mode
	    curMode = PROGRAM_MODE;
    }
    // PROGRAM => PRESET
    else {
	loadCurPreset();
	curMode = PRESET_MODE;
    }
    updateModeLED(modeLEDMap[curMode]);
#ifdef DEBUG_ME
    Serial.print("\nMode Changed: ");
    Serial.println(modeStringMap[curMode]);
#endif    
}

/*
  Read the input switches.
  Set the switch input MCP to address Port B. This is the MSB. Request 2
  bytes. Two subsequent read() calls will read the MSB, then the LSB (Port
  A). The reason this works is because I set IOCON.SEQOP to 1 in setup() which
  automatically increments the address pointer. Actually, when a port is
  addressed the address bounces back and forth B=>A=>B=>A... (page 5 of the
  datasheet).

  The unsigned 16 bit return value:

  Port B    Port A
  00000000  00000000
  ^                ^
  |                +-- switch 1 state
  |                    ...
  +------------------- switch 16 state
 */
uint16_t readSwitches() {
    Wire.beginTransmission(SWITCH_MCP_ADDR);
    Wire.write((byte)GPIOB);
    Wire.endTransmission();
    Wire.requestFrom(SWITCH_MCP_ADDR, 2);
    return (Wire.read() << 8) | Wire.read();
}

/*
  Debounce the switches.
  
  Based on code found here: http://www.ganssle.com/debouncing-pt2.htm
  
  Called from the main loop.
  
  The switches are read approximately every debounceTime milliseconds. This
  16bit word is saved at state[index]. index is then incremented and wrapped
  at MAX_SAMPLES. All these entries are AND'd. This result is the debounced
  state of the switches.

  The static prevDebouncedState is used to determine which switches have
  transistioned from released to stomped. This is the returned value.
*/
uint16_t debounceSwitch() {
    static uint16_t debouncedState = 0; // XXX: why did I make this static?
    static uint16_t prevDebouncedState = 0;
    static uint16_t state[MAX_SAMPLES] = {0};
    static uint16_t index = 0;
    uint16_t i = 0, j = 0xffff, result = 0;
    state[index] = readSwitches();
    index++;
    for (; i<MAX_SAMPLES; i++)
	j = j & state[i];
    debouncedState = j;
    if (index >= MAX_SAMPLES)
	index=0;
    /* result = (debouncedState ^ prevDebouncedState) & debouncedState; */
    result = debouncedState & ~prevDebouncedState;
    prevDebouncedState = debouncedState;
    return result;
}

/**************************************************************************
  Setup and Loop
*/

void setup() {
#ifdef DEBUG_ME
    Serial.begin(28800);
#endif
    Wire.begin();
    initIO();			// set up I2C bus and 328p pins
#ifdef RESET_ROM
    resetROM();			// force EEPROM reset
#else    
    initPresets();		// handle stored presets
#endif    
    loadCurPreset();		// load bank 0, offset 0
}

void loop() {
    // for flashing the bank 7seg and preset LEDs
    static unsigned long bankClock = millis();
    static boolean bankOn = false;
    static unsigned long ledClock = millis();
    static boolean ledOn = false;
    // for reading switches
    static unsigned long debounceClock = millis();
    uint16_t triggeredSwitches = 0;

    // check the switches approximately every debounceTime
    if (millis() - debounceClock > debounceTime) {
	triggeredSwitches = debounceSwitch();
	debounceClock = millis();
    }
    if (curMode == PRESET_MODE) {
	// Check LP1/10 first
	if (triggeredSwitches & SW_ANY_LP)
	    // shift OUT1/2 and CTL1/2 out, they are ignored
	    loadPreset(triggeredSwitches >> 4);
	else if (triggeredSwitches & SW_MODE)
	    nextMode();
	else if (triggeredSwitches & SW_BANK)
	    nextBank();
	// flash the bank if needed
	if (bankOutOfSync && (millis() - bankClock > FLASH_WAIT_TIME)) {
	    if (bankOn)
		update7Seg(-1);
	    else
		update7Seg(curBank + 1);
	    bankOn = !bankOn;
	    bankClock = millis();
	}
	// OUT1/2 and CTL1/2 are ignored in Preset mode
    }
    else if (curMode ==	MANUAL_MODE) {
	if (triggeredSwitches & SW_ANY_RELAY)
	    updateRelays(triggeredSwitches);
	else if (triggeredSwitches & SW_MODE)
	    nextMode();
	// BANK switch is ignored in Manual mode
    }
    else if (curMode == PROGRAM_MODE) {
	if (triggeredSwitches & SW_ANY_LP) {
	    savePreset(triggeredSwitches >> 4);
	    curMode = PRESET_MODE;
	    updateModeLED(modeLEDMap[curMode]);
	}
	else if (triggeredSwitches & SW_MODE)
	    nextMode();
	else if (triggeredSwitches & SW_BANK)
	    nextBank();
	// Preset LEDs are always flashed in Program mode until the user
	// stomps LP1/10 or MODE to exit Program mode.
	if (millis() - ledClock > FLASH_WAIT_TIME) {
	    if (ledOn)
		updatePresetLED(PRESET_LED_ALL_ON);
	    else
		updatePresetLED(PRESET_LED_ALL_OFF);
	    ledOn = !ledOn;
	    ledClock = millis();
	}
	// OUT1/2 and CTL1/2 are ignored in Program mode
    }
}
