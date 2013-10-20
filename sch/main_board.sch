v 20110115 2
C 34900 43200 1 0 0 MCP23017-2.sym
{
T 36900 47850 5 10 0 0 0 0 1
device=MCP23017
T 36800 48800 5 10 1 1 0 6 1
refdes=U?
T 36900 48050 5 10 0 0 0 0 1
footprint=DIP28
}
C 54400 45600 1 0 1 MCP23017-2.sym
{
T 52400 50250 5 10 0 0 0 6 1
device=MCP23017
T 52500 51200 5 10 1 1 0 0 1
refdes=U?
T 52400 50450 5 10 0 0 0 6 1
footprint=DIP28
}
C 54400 39900 1 0 1 MCP23017-2.sym
{
T 52400 44550 5 10 0 0 0 6 1
device=MCP23017
T 52500 45500 5 10 1 1 0 0 1
refdes=U?
T 52400 44750 5 10 0 0 0 6 1
footprint=DIP28
}
C 43500 43800 1 0 0 ATmega328P-1.sym
{
T 44100 47300 5 10 0 1 0 0 1
device=ATmega328p
T 45300 47000 5 10 1 1 0 0 1
refdes=U?
T 44200 47600 5 10 0 1 0 0 1
footprint=DIP28
}
C 56800 48700 1 0 0 uln2003.sym
{
T 58400 51500 5 10 0 1 0 0 1
footprint=DIP16
T 57900 51200 5 10 1 1 0 0 1
refdes=U?
}
C 56800 45600 1 0 0 uln2003.sym
{
T 58400 48400 5 10 0 1 0 0 1
footprint=DIP16
T 57900 48100 5 10 1 1 0 0 1
refdes=U?
}
N 37100 46000 39100 46000 4
N 39100 46000 39100 47700 4
N 39100 47700 46500 47700 4
N 46500 47700 46500 46600 4
N 45800 46600 50800 46600 4
N 45800 46400 50500 46400 4
N 46300 46400 46300 47500 4
N 46300 47500 39300 47500 4
N 39300 47500 39300 45700 4
N 39300 45700 37100 45700 4
C 45300 47900 1 90 0 resistor-1.sym
{
T 44900 48200 5 10 0 0 90 0 1
device=RESISTOR
T 45000 48100 5 10 1 1 90 0 1
refdes=R?
T 45000 48400 5 10 1 1 90 0 1
value=10k
}
C 46100 47900 1 90 0 resistor-1.sym
{
T 45700 48200 5 10 0 0 90 0 1
device=RESISTOR
T 45800 48100 5 10 1 1 90 0 1
refdes=R?
T 45800 48400 5 10 1 1 90 0 1
value=10k
}
N 46000 48800 46000 51500 4
N 45200 48800 45200 49100 4
N 45200 49100 46000 49100 4
N 46000 47900 46000 47700 4
N 45200 47900 45200 47500 4
N 52200 42700 50800 42700 4
N 50800 42700 50800 48400 4
N 50800 48400 52200 48400 4
N 52200 48100 50500 48100 4
N 50500 48100 50500 42400 4
N 50500 42400 52200 42400 4
N 56800 47800 54400 47800 4
N 56800 47500 54400 47500 4
{
T 54500 47500 5 10 1 1 0 0 1
netname=LP1_RELAY
}
N 56800 47200 54400 47200 4
N 56800 46900 54400 46900 4
N 56800 46600 54400 46600 4
{
T 54500 46600 5 10 1 1 0 0 1
netname=CTL1_RELAY
}
N 56800 46300 54400 46300 4
N 56800 46000 54400 46000 4
{
T 54500 46000 5 10 1 1 0 0 1
netname=OUT1_RELAY
}
N 54400 48100 56300 48100 4
N 56300 48100 56300 49100 4
N 56300 49100 56800 49100 4
N 54400 48700 56100 48700 4
N 56100 48700 56100 49400 4
N 56100 49400 56800 49400 4
N 54400 49000 55900 49000 4
N 55900 49000 55900 49700 4
N 55900 49700 56800 49700 4
N 54400 49300 55700 49300 4
N 55700 49300 55700 50000 4
N 55700 50000 56800 50000 4
N 54400 49600 55500 49600 4
N 55500 49600 55500 50300 4
N 55500 50300 56800 50300 4
N 54400 49900 55300 49900 4
N 55300 49900 55300 50600 4
N 55300 50600 56800 50600 4
N 54400 50200 55100 50200 4
N 55100 50200 55100 50900 4
N 55100 50900 56800 50900 4
{
T 55400 50900 5 10 1 1 0 0 1
netname=LP10_RELAY
}
C 54400 50700 1 0 0 nc-right-1.sym
{
T 54500 51200 5 10 0 0 0 0 1
value=NoConnection
T 54500 51400 5 10 0 0 0 0 1
device=DRC_Directive
}
C 54400 50400 1 0 0 nc-right-1.sym
{
T 54500 50900 5 10 0 0 0 0 1
value=NoConnection
T 54500 51100 5 10 0 0 0 0 1
device=DRC_Directive
}
C 54400 45000 1 0 0 nc-right-1.sym
{
T 54500 45500 5 10 0 0 0 0 1
value=NoConnection
T 54500 45700 5 10 0 0 0 0 1
device=DRC_Directive
}
C 54400 44700 1 0 0 nc-right-1.sym
{
T 54500 45200 5 10 0 0 0 0 1
value=NoConnection
T 54500 45400 5 10 0 0 0 0 1
device=DRC_Directive
}
C 54400 44400 1 0 0 nc-right-1.sym
{
T 54500 44900 5 10 0 0 0 0 1
value=NoConnection
T 54500 45100 5 10 0 0 0 0 1
device=DRC_Directive
}
C 41600 44400 1 0 0 crystal-1.sym
{
T 41800 44900 5 10 0 0 0 0 1
device=CRYSTAL
T 41800 44700 5 10 1 1 0 0 1
refdes=U?
T 41800 45100 5 10 0 0 0 0 1
symversion=0.1
}
C 41600 43400 1 90 0 capacitor-1.sym
{
T 40900 43600 5 10 0 0 90 0 1
device=CAPACITOR
T 41300 44100 5 10 1 1 180 0 1
refdes=C?
T 40700 43600 5 10 0 0 90 0 1
symversion=0.1
T 41500 43600 5 10 1 1 0 0 1
value=22pF
}
C 42700 43400 1 90 0 capacitor-1.sym
{
T 42000 43600 5 10 0 0 90 0 1
device=CAPACITOR
T 42400 44100 5 10 1 1 180 0 1
refdes=C?
T 41800 43600 5 10 0 0 90 0 1
symversion=0.1
T 42000 43600 5 10 1 1 0 0 1
value=22pF
}
N 42500 43400 42500 43200 4
N 40800 43200 42500 43200 4
N 40800 39600 40800 45200 4
N 41400 43400 41400 43200 4
N 41600 44500 41400 44500 4
N 41400 44300 41400 45000 4
N 42300 44500 42500 44500 4
N 42500 44300 42500 44800 4
N 42500 44800 43500 44800 4
N 41400 45000 43500 45000 4
N 43500 45200 40800 45200 4
N 43500 46600 40800 46600 4
N 40800 45400 40800 51500 4
N 43500 45400 40800 45400 4
N 43500 44200 42900 44200 4
N 42900 44200 42900 42100 4
{
T 42900 42600 5 10 1 1 270 0 1
netname=DIP1
}
N 43500 44000 43200 44000 4
N 43200 44000 43200 42100 4
N 45800 44000 46100 44000 4
N 46100 44000 46100 43500 4
N 43500 43500 46100 43500 4
N 43500 43500 43500 42100 4
N 45800 44200 46300 44200 4
N 46300 44200 46300 43300 4
N 43800 43300 46300 43300 4
N 43800 43300 43800 42100 4
{
T 43800 42600 5 10 1 1 270 0 1
netname=DIP4
}
C 49700 40400 1 90 0 connector8-1.sym
{
T 46500 40500 5 10 0 0 90 0 1
device=CONNECTOR_8
T 47200 40200 5 10 1 1 0 0 1
refdes=SEVEN_SEG_CON
}
N 45800 46200 49500 46200 4
N 49500 43300 49500 42100 4
{
T 49500 42900 5 10 1 1 270 0 1
netname=7SEG_G
}
N 45800 46000 49200 46000 4
N 49200 43300 49200 42100 4
N 45800 45800 48900 45800 4
N 48900 43300 48900 42100 4
N 45800 45600 48600 45600 4
N 48600 43300 48600 42100 4
N 45800 44800 48300 44800 4
N 48300 43300 48300 42100 4
N 45800 44600 48000 44600 4
N 48000 43300 48000 42100 4
N 45800 44400 47700 44400 4
N 47700 43300 47700 42100 4
{
T 47700 42900 5 10 1 1 270 0 1
netname=7SEG_A
}
N 46700 39600 46700 45400 4
N 46700 42500 47400 42500 4
N 47400 42500 47400 42100 4
N 45800 45400 46700 45400 4
N 45800 45000 47700 45000 4
N 47700 45000 47700 51500 4
N 52200 43600 50000 43600 4
N 50000 40600 50000 51500 4
N 52200 49300 50000 49300 4
N 52200 46900 50000 46900 4
N 52200 41200 50000 41200 4
C 52300 44100 1 90 0 capacitor-1.sym
{
T 51600 44300 5 10 0 0 90 0 1
device=CAPACITOR
T 51900 44800 5 10 1 1 180 0 1
refdes=C?
T 51400 44300 5 10 0 0 90 0 1
symversion=0.1
T 51600 44200 5 10 1 1 0 0 1
value=.1uF
}
C 51900 49800 1 90 0 capacitor-1.sym
{
T 51200 50000 5 10 0 0 90 0 1
device=CAPACITOR
T 51500 50600 5 10 1 1 180 0 1
refdes=C?
T 51000 50000 5 10 0 0 90 0 1
symversion=0.1
T 51900 50400 5 10 1 1 0 0 1
value=.1uF
}
N 52200 43300 51300 43300 4
N 51300 39600 51300 49000 4
N 52200 40600 50000 40600 4
N 52200 49000 51300 49000 4
N 52200 40300 51300 40300 4
N 52200 40900 51300 40900 4
N 52100 45000 52100 45100 4
N 52100 45100 51500 45100 4
N 51500 45100 51500 43600 4
N 52100 44100 52100 43300 4
N 51700 49800 51700 49000 4
N 51700 50700 51700 51000 4
N 51700 51000 50900 51000 4
N 50900 51000 50900 49300 4
N 52200 46000 50000 46000 4
N 52200 46300 51300 46300 4
N 52200 46600 51300 46600 4
N 56800 48800 56500 48800 4
N 56500 39600 56500 48800 4
N 56800 45700 56500 45700 4
C 30600 38900 1 0 0 gnd-1.sym
N 30700 39200 30700 44500 4
N 30700 39600 70600 39600 4
N 71800 45800 71800 62300 4
N 71800 45800 58400 45700 4
N 58400 48800 71800 48900 4
N 37100 46600 38700 46600 4
N 38700 46600 38700 39600 4
C 30500 52000 1 0 0 5V-plus-1.sym
N 30700 47300 30700 52000 4
N 30700 51500 50000 51500 4
N 37100 46900 38500 46900 4
N 38500 44500 38500 51500 4
N 37100 43600 38700 43600 4
N 37100 43900 38700 43900 4
N 37100 44200 38700 44200 4
N 37100 44500 38500 44500 4
C 38200 47400 1 90 0 capacitor-1.sym
{
T 37500 47600 5 10 0 0 90 0 1
device=CAPACITOR
T 37800 48100 5 10 1 1 180 0 1
refdes=C?
T 37300 47600 5 10 0 0 90 0 1
symversion=0.1
T 38100 48000 5 10 1 1 0 0 1
value=.1uF
}
N 38000 47400 38000 46600 4
N 38000 48300 38000 48600 4
N 38000 48600 37400 48600 4
N 37400 48600 37400 46900 4
C 68500 58700 1 0 0 relay_az850-9.sym
{
T 67682 60134 5 10 0 1 0 0 1
device=Zettler AZ850
T 69013 60141 5 10 1 1 0 0 1
refdes=K?
}
N 69400 59900 72800 59900 4
N 68000 59800 68500 59800 4
N 69400 59300 69700 59300 4
N 68400 59400 68500 59400 4
N 68400 59400 68400 63600 4
N 69700 59300 69700 59900 4
N 69500 59700 69500 63600 4
N 69500 59700 69400 59700 4
N 68800 55000 68800 58700 4
N 69100 47200 69100 58700 4
C 66400 58700 1 0 0 relay_az850-9.sym
{
T 65582 60134 5 10 0 1 0 0 1
device=Zettler AZ850
T 66913 60141 5 10 1 1 0 0 1
refdes=K?
}
N 67300 59900 68000 59900 4
N 65900 59800 66400 59800 4
N 67300 59300 67600 59300 4
N 67600 59300 67600 59900 4
N 66700 55000 66700 58700 4
N 67000 47500 67000 58700 4
C 64300 58700 1 0 0 relay_az850-9.sym
{
T 63482 60134 5 10 0 1 0 0 1
device=Zettler AZ850
T 64813 60141 5 10 1 1 0 0 1
refdes=K?
}
N 65200 59900 65900 59900 4
N 63800 59800 64300 59800 4
N 65200 59300 65500 59300 4
N 65500 59300 65500 59900 4
N 64600 55000 64600 58700 4
N 64900 47900 64900 58700 4
C 62200 58700 1 0 0 relay_az850-9.sym
{
T 61382 60134 5 10 0 1 0 0 1
device=Zettler AZ850
}
N 63100 59900 63800 59900 4
N 61700 59800 62200 59800 4
N 63100 59300 63400 59300 4
N 63400 59300 63400 59900 4
N 62500 55000 62500 58700 4
N 62800 49100 62800 58700 4
C 60100 58700 1 0 0 relay_az850-9.sym
{
T 59282 60134 5 10 0 1 0 0 1
device=Zettler AZ850
T 60613 60141 5 10 1 1 0 0 1
refdes=K?
}
N 61000 59900 61700 59900 4
N 61000 59300 61300 59300 4
N 61300 59300 61300 59900 4
N 60400 55000 60400 58700 4
N 61500 49400 61500 57400 4
N 68000 59900 68000 59800 4
N 65900 59900 65900 59800 4
N 63800 59900 63800 59800 4
N 61700 59900 61700 59800 4
C 57900 58700 1 0 0 relay_az850-9.sym
{
T 57082 60134 5 10 0 1 0 0 1
device=Zettler AZ850
T 58413 60141 5 10 1 1 0 0 1
refdes=K?
}
N 57400 59800 57900 59800 4
N 58800 59300 59100 59300 4
N 59100 59300 59100 59900 4
N 58200 55000 58200 58700 4
N 59300 54200 59300 57400 4
N 57400 59800 57400 59900 4
N 56700 59900 57400 59900 4
C 55800 58700 1 0 0 relay_az850-9.sym
{
T 54982 60134 5 10 0 1 0 0 1
device=Zettler AZ850
T 56313 60141 5 10 1 1 0 0 1
refdes=K?
}
N 55300 59800 55800 59800 4
N 56700 59300 57000 59300 4
N 57000 59300 57000 59900 4
N 56100 55000 56100 58700 4
N 57200 53900 57200 57400 4
N 56400 57400 57200 57400 4
N 55300 59800 55300 59900 4
N 54600 59900 55300 59900 4
C 53700 58700 1 0 0 relay_az850-9.sym
{
T 52882 60134 5 10 0 1 0 0 1
device=Zettler AZ850
T 54213 60141 5 10 1 1 0 0 1
refdes=K?
}
N 53200 59800 53700 59800 4
N 54600 59300 54900 59300 4
N 54900 59300 54900 59900 4
N 54000 55000 54000 58700 4
N 55100 53600 55100 57400 4
N 54300 57400 55100 57400 4
N 53200 59800 53200 59900 4
N 52500 59900 53200 59900 4
C 51600 58700 1 0 0 relay_az850-9.sym
{
T 50782 60134 5 10 0 1 0 0 1
device=Zettler AZ850
T 52113 60141 5 10 1 1 0 0 1
refdes=K?
}
N 51100 59800 51600 59800 4
N 52500 59300 52800 59300 4
N 52800 59300 52800 59900 4
N 51900 55000 51900 58700 4
N 53000 53300 53000 57400 4
N 52200 57400 53000 57400 4
N 51100 59800 51100 59900 4
N 50400 59900 51100 59900 4
C 49500 58700 1 0 0 relay_az850-9.sym
{
T 48682 60134 5 10 0 1 0 0 1
device=Zettler AZ850
T 50013 60141 5 10 1 1 0 0 1
refdes=K?
}
N 50100 57400 50100 58700 4
N 46900 59800 49500 59800 4
N 50400 59300 50700 59300 4
N 50700 59300 50700 59900 4
N 49800 55000 49800 58700 4
N 50900 53000 50900 57400 4
N 50100 57400 50900 57400 4
N 58800 59900 59700 59900 4
N 59700 59900 59700 59800 4
N 59700 59800 60100 59800 4
C 32300 60700 1 90 0 connector2-2.sym
{
T 31400 61600 5 10 1 1 180 6 1
refdes=OUT1
T 31050 61000 5 10 0 0 90 0 1
device=CONNECTOR_2
T 30850 61000 5 10 0 1 90 0 1
footprint=CONNECTOR_1_2
}
C 35700 60700 1 90 0 connector2-2.sym
{
T 34800 61600 5 10 1 1 180 6 1
refdes=OUT2
T 34450 61000 5 10 0 0 90 0 1
device=CONNECTOR_2
T 34250 61000 5 10 0 1 90 0 1
footprint=CONNECTOR_1_2
}
C 32800 58600 1 0 0 relay_az850-9.sym
{
T 31982 60034 5 10 0 1 0 0 1
device=Zettler AZ850
T 33313 60041 5 10 1 1 0 0 1
refdes=K?
}
C 36200 58600 1 0 0 relay_az850-9.sym
{
T 35382 60034 5 10 0 1 0 0 1
device=Zettler AZ850
T 36713 60041 5 10 1 1 0 0 1
refdes=K?
}
N 37100 59200 46900 59200 4
N 37700 59600 37700 60300 4
N 34300 60300 37700 60300 4
N 34300 59600 34300 60300 4
N 34300 59600 33700 59600 4
N 36200 59700 35300 59700 4
N 35300 59700 35300 60700 4
N 32800 59700 31900 59700 4
N 31900 59700 31900 60700 4
C 63500 44800 1 180 0 connector3-2.sym
{
T 62600 43800 5 10 1 1 270 6 1
refdes=CTL1_CON
T 63200 43150 5 10 0 0 180 0 1
device=CONNECTOR_3
T 63200 42950 5 10 0 0 180 0 1
footprint=SIP3N
}
N 65700 40400 65700 43100 4
N 68100 40700 68100 43100 4
C 67500 43100 1 0 0 relay_az850-9.sym
{
T 66682 44534 5 10 0 1 0 0 1
device=Zettler AZ850
T 68013 44541 5 10 1 1 0 0 1
refdes=K?
}
C 65100 43100 1 0 0 relay_az850-9.sym
{
T 64282 44534 5 10 0 1 0 0 1
device=Zettler AZ850
T 65613 44541 5 10 1 1 0 0 1
refdes=K?
}
N 66000 42800 67800 42800 4
N 67800 42800 67800 43100 4
N 66000 39600 66000 42800 4
N 63600 42800 65400 42800 4
N 65400 42800 65400 43100 4
N 63600 39600 63600 42800 4
N 63500 44400 63600 44400 4
N 63600 44400 63600 44900 4
N 63600 44900 69000 44900 4
N 69000 44100 69000 44900 4
N 69000 44100 68400 44100 4
N 66000 44100 66700 44100 4
N 66700 44100 66700 44900 4
N 63500 43600 64500 43600 4
N 64500 43600 64500 44200 4
N 64500 44200 65100 44200 4
N 63500 44000 64300 44000 4
N 64300 44000 64300 45100 4
N 64300 45100 67100 45100 4
N 67100 44200 67100 45100 4
N 67100 44200 67500 44200 4
C 64600 43700 1 0 0 nc-left-1.sym
{
T 64600 44100 5 10 0 0 0 0 1
value=NoConnection
T 64600 44500 5 10 0 0 0 0 1
device=DRC_Directive
}
C 66500 44400 1 180 0 nc-left-1.sym
{
T 66500 44000 5 10 0 0 180 0 1
value=NoConnection
T 66500 43600 5 10 0 0 180 0 1
device=DRC_Directive
}
C 66500 44000 1 180 0 nc-left-1.sym
{
T 66500 43600 5 10 0 0 180 0 1
value=NoConnection
T 66500 43200 5 10 0 0 180 0 1
device=DRC_Directive
}
C 66500 43800 1 180 0 nc-left-1.sym
{
T 66500 43400 5 10 0 0 180 0 1
value=NoConnection
T 66500 43000 5 10 0 0 180 0 1
device=DRC_Directive
}
C 68900 44000 1 180 0 nc-left-1.sym
{
T 68900 43600 5 10 0 0 180 0 1
value=NoConnection
T 68900 43200 5 10 0 0 180 0 1
device=DRC_Directive
}
C 68900 44400 1 180 0 nc-left-1.sym
{
T 68900 44000 5 10 0 0 180 0 1
value=NoConnection
T 68900 43600 5 10 0 0 180 0 1
device=DRC_Directive
}
C 69300 42300 1 0 0 connector2-2.sym
{
T 70200 43300 5 10 1 1 90 6 1
refdes=CTL2_CON
T 69600 43550 5 10 0 0 0 0 1
device=CONNECTOR_2
T 69600 43750 5 10 0 1 0 0 1
footprint=CONNECTOR_1_2
}
N 68400 43700 68600 43700 4
N 68600 42700 68600 43700 4
N 68600 42700 69300 42700 4
N 67500 43800 67300 43800 4
N 67300 43800 67300 45100 4
N 67300 45100 69200 45100 4
N 69200 43700 69200 45100 4
N 69200 43700 68800 43700 4
N 68800 43700 68800 43100 4
N 68800 43100 69300 43100 4
T 62500 42700 9 8 1 0 0 0 3
1 TIP
2 RING
3 SLEEVE
N 58400 46600 61800 46600 4
N 61800 46600 61800 40400 4
N 61800 40400 65700 40400 4
N 68100 40700 62100 40700 4
N 62100 40700 62100 46900 4
N 62100 46900 58400 46900 4
N 58400 46000 59000 46000 4
N 59000 46000 59000 52400 4
N 34200 52400 59000 52400 4
N 37600 52700 59300 52700 4
N 59300 52700 59300 46300 4
N 59300 46300 58400 46300 4
N 46900 59200 46900 59800 4
N 58400 47200 69100 47200 4
N 58400 47500 67000 47500 4
N 58400 47800 64900 47900 4
N 58400 49100 62800 49100 4
N 58400 49400 61500 49400 4
N 58400 50900 60000 50900 4
N 60000 50900 60000 53000 4
N 60000 53000 50900 53000 4
N 58400 50600 60300 50600 4
N 60300 50600 60300 53300 4
N 60300 53300 53000 53300 4
N 58400 50300 60600 50300 4
N 60600 50300 60600 53600 4
N 55100 53600 60600 53600 4
N 58400 50000 60900 50000 4
N 60900 50000 60900 53900 4
N 57200 53900 60900 53900 4
N 58400 49700 61200 49700 4
N 61200 49700 61200 54200 4
N 59300 54200 61200 54200 4
N 59500 40300 57600 40300 4
{
T 58300 40300 5 10 1 1 0 0 1
netname=PSET1_LED
}
N 59500 40600 57600 40600 4
N 59500 40900 57600 40900 4
N 59500 41200 57600 41200 4
N 59500 41500 57600 41500 4
N 59500 41800 57600 41800 4
N 59500 42100 57600 42100 4
N 59500 42400 57600 42400 4
N 59500 42700 57600 42700 4
N 54600 42700 54600 43000 4
N 54600 43000 54400 43000 4
N 54400 43300 54900 43300 4
N 54900 43300 54900 43000 4
N 57600 43000 59500 43000 4
{
T 58300 43000 5 10 1 1 0 0 1
netname=PSET10_LED
}
N 59500 43300 57600 43300 4
{
T 58200 43300 5 10 1 1 0 0 1
netname=MODE_R_LED
}
N 55200 43300 55200 43600 4
N 55200 43600 54400 43600 4
N 54400 43900 55500 43900 4
N 55500 43900 55500 43600 4
N 57600 43600 59500 43600 4
{
T 58200 43600 5 10 1 1 0 0 1
netname=MODE_G_LED
}
C 61200 44100 1 180 0 connector13-1.sym
{
T 59400 40500 5 10 0 0 180 0 1
device=CONNECTOR_13
T 61200 40000 5 10 1 1 180 0 1
refdes=LED?
}
N 59500 43900 57600 43900 4
{
T 58200 43900 5 10 1 1 0 0 1
netname=MODE_B_LED
}
N 55800 43900 55800 44200 4
N 55800 44200 54400 44200 4
N 70600 39600 70600 55000 4
N 70600 55000 33100 55000 4
C 31200 48400 1 180 1 connector16-1.sym
{
T 33100 43500 5 10 0 0 180 6 1
device=CONNECTOR_16
T 31300 43300 5 10 1 1 180 6 1
refdes=SW
}
N 34900 43600 33000 43600 4
{
T 33100 43600 5 10 1 1 0 0 1
netname=OUT1_SW
}
N 34900 43900 33000 43900 4
N 34900 44200 33000 44200 4
{
T 33100 44200 5 10 1 1 0 0 1
netname=CTL1_SW
}
N 34900 44500 33000 44500 4
N 34900 44800 33000 44800 4
{
T 33100 44800 5 10 1 1 0 0 1
netname=LP1_SW
}
N 34900 45100 33000 45100 4
N 34900 45400 33000 45400 4
N 34900 45700 33000 45700 4
N 33000 46000 34700 46000 4
N 34700 46000 34700 46300 4
N 34700 46300 34900 46300 4
N 33000 46300 34500 46300 4
N 34500 46300 34500 46600 4
N 34500 46600 34900 46600 4
N 33000 46600 34300 46600 4
N 34300 46600 34300 46900 4
N 34300 46900 34900 46900 4
N 33000 46900 34100 46900 4
N 34100 46900 34100 47200 4
N 34100 47200 34900 47200 4
N 33000 47200 33900 47200 4
N 33900 47200 33900 47500 4
N 33900 47500 34900 47500 4
N 33000 47500 33700 47500 4
{
T 33800 47800 5 10 1 1 0 0 1
netname=LP10_SW
}
N 33700 47500 33700 47800 4
N 33700 47800 34900 47800 4
N 33000 47800 33500 47800 4
N 33500 47800 33500 48100 4
N 33500 48100 34900 48100 4
{
T 33700 48100 5 10 1 1 0 0 1
netname=BANK_SW
}
N 33000 48100 33300 48100 4
N 33300 48100 33300 48400 4
N 33300 48400 34900 48400 4
{
T 33700 48400 5 10 1 1 0 0 1
netname=MODE_SW
}
C 44000 40400 1 90 0 connector5-1.sym
{
T 42500 42200 5 10 0 0 90 0 1
device=CONNECTOR_5
T 42400 40200 5 10 1 1 0 0 1
refdes=CFG_DIP_CON
}
N 42600 42100 42600 42500 4
N 42600 42500 41700 42500 4
N 41700 42500 41700 39600 4
C 27500 46700 1 0 0 lm7805-1.sym
{
T 29100 48000 5 10 0 0 0 0 1
device=7805
T 28900 47700 5 10 1 1 0 6 1
refdes=U?
}
C 27100 45600 1 90 0 capacitor-1.sym
{
T 26400 45800 5 10 0 0 90 0 1
device=CAPACITOR
T 26700 46300 5 10 1 1 180 0 1
refdes=C?
T 26200 45800 5 10 0 0 90 0 1
symversion=0.1
T 27000 46200 5 10 1 1 0 0 1
value=10uF
}
C 29700 45600 1 90 0 capacitor-1.sym
{
T 29000 45800 5 10 0 0 90 0 1
device=CAPACITOR
T 29300 46300 5 10 1 1 180 0 1
refdes=C?
T 28800 45800 5 10 0 0 90 0 1
symversion=0.1
T 29600 46200 5 10 1 1 0 0 1
value=1uF
}
C 24700 46800 1 180 0 connector2-2.sym
{
T 24000 45500 5 10 1 1 180 6 1
refdes=9VDC
T 24400 45550 5 10 0 0 180 0 1
device=CONNECTOR_2
T 24400 45350 5 10 0 0 180 0 1
footprint=SIP2N
T 24300 46200 5 10 0 1 0 0 1
footprint=CONNECTOR_1_2
}
N 24700 46000 25900 46000 4
N 25900 44500 25900 46000 4
N 25900 44500 30700 44500 4
N 29500 45600 29500 44500 4
N 26900 45600 26900 44500 4
N 26900 46500 26900 47300 4
N 25900 47300 27500 47300 4
N 29100 47300 30700 47300 4
N 29500 47300 29500 46500 4
N 28300 46700 28300 44500 4
N 25900 46400 25900 62800 4
N 25900 46400 24700 46400 4
N 25900 62300 71800 62300 4
C 25700 62800 1 0 0 9V-plus-1.sym
C 41900 45600 1 0 0 capacitor-1.sym
{
T 42100 46300 5 10 0 0 0 0 1
device=CAPACITOR
T 41900 46000 5 10 1 1 0 0 1
refdes=C?
T 42100 46500 5 10 0 0 0 0 1
symversion=0.1
T 42500 46000 5 10 1 1 0 0 1
value=.1uF
}
N 41900 45800 41400 45800 4
N 41400 45800 41400 45200 4
N 42800 45800 43100 45800 4
N 43100 45800 43100 45400 4
C 56700 43800 1 0 0 resistor-1.sym
{
T 57000 44200 5 10 0 0 0 0 1
device=RESISTOR
T 56600 44000 5 10 1 1 0 0 1
refdes=R?
T 57400 44000 5 10 1 1 0 0 1
value=1k
}
C 56700 43500 1 0 0 resistor-1.sym
{
T 57000 43900 5 10 0 0 0 0 1
device=RESISTOR
T 56600 43700 5 10 1 1 0 0 1
refdes=R?
T 57400 43700 5 10 1 1 0 0 1
value=1k
}
C 56700 43200 1 0 0 resistor-1.sym
{
T 57000 43600 5 10 0 0 0 0 1
device=RESISTOR
T 56600 43400 5 10 1 1 0 0 1
refdes=R?
T 57400 43400 5 10 1 1 0 0 1
value=1k
}
C 56700 42900 1 0 0 resistor-1.sym
{
T 57000 43300 5 10 0 0 0 0 1
device=RESISTOR
T 56600 43100 5 10 1 1 0 0 1
refdes=R?
T 57400 43100 5 10 1 1 0 0 1
value=1k
}
C 56700 42600 1 0 0 resistor-1.sym
{
T 57000 43000 5 10 0 0 0 0 1
device=RESISTOR
T 56600 42800 5 10 1 1 0 0 1
refdes=R?
T 57400 42800 5 10 1 1 0 0 1
value=1k
}
C 56700 42300 1 0 0 resistor-1.sym
{
T 57000 42700 5 10 0 0 0 0 1
device=RESISTOR
T 56600 42500 5 10 1 1 0 0 1
refdes=R?
T 57400 42500 5 10 1 1 0 0 1
value=1k
}
C 56700 42000 1 0 0 resistor-1.sym
{
T 57000 42400 5 10 0 0 0 0 1
device=RESISTOR
T 56600 42200 5 10 1 1 0 0 1
refdes=R?
T 57400 42200 5 10 1 1 0 0 1
value=1k
}
C 56700 41700 1 0 0 resistor-1.sym
{
T 57000 42100 5 10 0 0 0 0 1
device=RESISTOR
T 56600 41900 5 10 1 1 0 0 1
refdes=R?
T 57400 41900 5 10 1 1 0 0 1
value=1k
}
C 56700 41400 1 0 0 resistor-1.sym
{
T 57000 41800 5 10 0 0 0 0 1
device=RESISTOR
T 56600 41600 5 10 1 1 0 0 1
refdes=R?
T 57400 41600 5 10 1 1 0 0 1
value=1k
}
C 56700 41100 1 0 0 resistor-1.sym
{
T 57000 41500 5 10 0 0 0 0 1
device=RESISTOR
T 56600 41300 5 10 1 1 0 0 1
refdes=R?
T 57400 41300 5 10 1 1 0 0 1
value=1k
}
C 56700 40800 1 0 0 resistor-1.sym
{
T 57000 41200 5 10 0 0 0 0 1
device=RESISTOR
T 56600 41000 5 10 1 1 0 0 1
refdes=R?
T 57400 41000 5 10 1 1 0 0 1
value=1k
}
C 56700 40500 1 0 0 resistor-1.sym
{
T 57000 40900 5 10 0 0 0 0 1
device=RESISTOR
T 56600 40700 5 10 1 1 0 0 1
refdes=R?
T 57400 40700 5 10 1 1 0 0 1
value=1k
}
C 56700 40200 1 0 0 resistor-1.sym
{
T 57000 40600 5 10 0 0 0 0 1
device=RESISTOR
T 56600 40400 5 10 1 1 0 0 1
refdes=R?
T 57400 40400 5 10 1 1 0 0 1
value=1k
}
N 54400 40300 56700 40300 4
N 54400 40600 56700 40600 4
N 54400 40900 56700 40900 4
N 54400 41200 56700 41200 4
N 54400 41500 56700 41500 4
N 54400 41800 56700 41800 4
N 54400 42100 56700 42100 4
N 54400 42400 56700 42400 4
N 54600 42700 56700 42700 4
N 54900 43000 56700 43000 4
N 55200 43300 56700 43300 4
N 55500 43600 56700 43600 4
N 55800 43900 56700 43900 4
C 47600 44200 1 270 0 resistor-1.sym
{
T 48000 43900 5 10 0 0 270 0 1
device=RESISTOR
T 47800 44300 5 10 1 1 270 0 1
refdes=R?
T 47800 43500 5 10 1 1 270 0 1
value=1k
}
C 47900 44200 1 270 0 resistor-1.sym
{
T 48300 43900 5 10 0 0 270 0 1
device=RESISTOR
T 48100 44300 5 10 1 1 270 0 1
refdes=R?
T 48100 43500 5 10 1 1 270 0 1
value=1k
}
C 48200 44200 1 270 0 resistor-1.sym
{
T 48600 43900 5 10 0 0 270 0 1
device=RESISTOR
T 48400 44300 5 10 1 1 270 0 1
refdes=R?
T 48400 43500 5 10 1 1 270 0 1
value=1k
}
C 48500 44200 1 270 0 resistor-1.sym
{
T 48900 43900 5 10 0 0 270 0 1
device=RESISTOR
T 48700 44300 5 10 1 1 270 0 1
refdes=R?
T 48700 43500 5 10 1 1 270 0 1
value=1k
}
C 48800 44200 1 270 0 resistor-1.sym
{
T 49200 43900 5 10 0 0 270 0 1
device=RESISTOR
T 49000 44300 5 10 1 1 270 0 1
refdes=R?
T 49000 43500 5 10 1 1 270 0 1
value=1k
}
C 49100 44200 1 270 0 resistor-1.sym
{
T 49500 43900 5 10 0 0 270 0 1
device=RESISTOR
T 49300 44300 5 10 1 1 270 0 1
refdes=R?
T 49300 43500 5 10 1 1 270 0 1
value=1k
}
C 49400 44200 1 270 0 resistor-1.sym
{
T 49800 43900 5 10 0 0 270 0 1
device=RESISTOR
T 49600 44300 5 10 1 1 270 0 1
refdes=R?
T 49600 43500 5 10 1 1 270 0 1
value=1k
}
N 49500 46200 49500 44200 4
N 49200 46000 49200 44200 4
N 48900 45800 48900 44200 4
N 48600 45600 48600 44200 4
N 48300 44800 48300 44200 4
N 48000 44600 48000 44200 4
N 47700 44400 47700 44200 4
N 52200 57400 52200 58700 4
N 54300 57400 54300 58700 4
N 56400 57400 56400 58700 4
N 36800 57300 36800 58600 4
N 37600 52700 37600 57300 4
N 36800 57300 37600 57300 4
N 36500 55000 36500 58600 4
N 33400 57300 33400 58600 4
N 34200 52400 34200 57300 4
N 33400 57300 34200 57300 4
N 33100 54300 33100 58600 4
C 67200 41700 1 0 0 resistor-1.sym
{
T 67500 42100 5 10 0 0 0 0 1
device=RESISTOR
T 67400 42000 5 10 1 1 0 0 1
refdes=R?
T 67700 42000 5 10 1 1 0 0 1
value=470
}
N 67200 41800 67000 41800 4
C 67000 42200 1 180 0 connector1-2.sym
{
T 66100 42200 5 10 1 1 270 0 1
refdes=LEDCON?
T 66700 41350 5 10 0 0 180 0 1
device=CONNECTOR_1
T 66700 41150 5 10 0 0 180 0 1
footprint=SIP1N
}
C 64800 41700 1 0 0 resistor-1.sym
{
T 65100 42100 5 10 0 0 0 0 1
device=RESISTOR
T 65000 42000 5 10 1 1 0 0 1
refdes=R?
T 65300 42000 5 10 1 1 0 0 1
value=470
}
N 64800 41800 64600 41800 4
C 64600 42200 1 180 0 connector1-2.sym
{
T 63700 42200 5 10 1 1 270 0 1
refdes=LEDCON?
T 64300 41350 5 10 0 0 180 0 1
device=CONNECTOR_1
T 64300 41150 5 10 0 0 180 0 1
footprint=SIP1N
}
N 37700 58200 37700 59200 4
N 34300 58200 34300 59200 4
N 34300 59200 33700 59200 4
N 36200 59300 34900 59300 4
N 34900 59300 34900 60700 4
N 32800 59300 31500 59300 4
N 31500 59300 31500 60700 4
T 32800 61600 9 10 1 0 0 0 2
PIN1: TIP
PIN2: SLEEVE
C 33000 60800 1 0 0 resistor-1.sym
{
T 33300 61200 5 10 0 0 0 0 1
device=RESISTOR
T 33200 61100 5 10 1 1 0 0 1
refdes=R?
T 33300 60600 5 10 1 1 0 0 1
value=100
}
C 36500 60800 1 0 0 resistor-1.sym
{
T 36800 61200 5 10 0 0 0 0 1
device=RESISTOR
T 36700 61100 5 10 1 1 0 0 1
refdes=R?
T 36800 60600 5 10 1 1 0 0 1
value=100
}
N 33700 59400 34100 59400 4
N 34100 59400 34100 60900 4
N 34100 60900 33900 60900 4
N 33000 60900 32800 60900 4
N 32800 60400 32800 60900 4
N 32800 60400 33900 60400 4
N 33900 59800 33900 60400 4
N 33900 59800 33700 59800 4
N 37100 59400 37500 59400 4
N 37500 59400 37500 60900 4
N 37500 60900 37400 60900 4
N 36500 60900 36200 60900 4
N 36200 60400 36200 60900 4
N 36200 60400 37300 60400 4
N 37300 60400 37300 59800 4
N 37300 59800 37100 59800 4
T 26800 38800 9 24 1 0 0 0 1
POWER
T 33300 38800 9 24 1 0 0 0 1
INPUT MCP
T 44600 38800 9 24 1 0 0 0 1
CORE
T 64800 38800 9 24 1 0 0 0 1
AMP CONTROL
T 32900 62800 9 24 1 0 0 0 1
AMP OUTPUT
T 75200 59200 9 24 1 0 0 0 2
GUITAR
IN
T 54300 38800 9 24 1 0 0 0 1
OUTPUT MCP
N 34300 58200 37700 58200 4
N 38800 59600 38800 60700 4
C 39200 60700 1 90 0 connector1-2.sym
{
T 38400 61500 5 10 1 1 0 0 1
refdes=SLEEVE
T 38350 61000 5 10 0 0 90 0 1
device=CONNECTOR_1
T 38150 61000 5 10 0 0 90 0 1
footprint=SIP1N
}
N 38800 59600 37100 59600 4
C 29600 59500 1 0 0 photodiode.sym
{
T 30300 60100 5 10 1 1 0 0 1
refdes=D?
T 30300 59700 5 8 0 1 0 0 1
footprint=BPW34
T 30300 59900 5 10 0 1 0 0 1
value=BPW34
T 29800 61500 5 8 0 0 0 0 1
symversion=1.0
}
C 28700 60400 1 270 0 led-3.sym
{
T 29350 59450 5 10 0 0 270 0 1
device=LED
T 29250 59950 5 10 1 1 270 0 1
refdes=D?
}
N 30000 60400 30000 60500 4
N 30000 60500 31900 60500 4
N 30000 59500 30000 59400 4
N 30000 59400 31500 59400 4
C 27500 60700 1 0 0 resistor-1.sym
{
T 27800 61100 5 10 0 0 0 0 1
device=RESISTOR
T 27700 61000 5 10 1 1 0 0 1
refdes=R?
T 27800 60500 5 10 1 1 0 0 1
value=1k
}
N 28400 60800 28900 60800 4
N 28900 60800 28900 60400 4
N 27500 60800 27200 60800 4
N 27200 54300 27200 60800 4
N 28900 58500 28900 59500 4
C 29600 55700 1 0 0 photodiode.sym
{
T 30300 56300 5 10 1 1 0 0 1
refdes=D?
T 30300 55900 5 8 0 1 0 0 1
footprint=BPW34
T 30300 56100 5 10 0 1 0 0 1
value=BPW34
T 29800 57700 5 8 0 0 0 0 1
symversion=1.0
}
C 28700 56600 1 270 0 led-3.sym
{
T 29350 55650 5 10 0 0 270 0 1
device=LED
T 29250 56150 5 10 1 1 270 0 1
refdes=D?
}
C 27500 56900 1 0 0 resistor-1.sym
{
T 27800 57300 5 10 0 0 0 0 1
device=RESISTOR
T 27700 57200 5 10 1 1 0 0 1
refdes=R?
T 27800 56700 5 10 1 1 0 0 1
value=1k
}
N 28900 56600 28900 57000 4
N 28900 57000 28400 57000 4
N 27500 57000 27200 57000 4
N 30000 56600 30000 57800 4
N 30000 57800 35200 57800 4
N 35200 57800 35200 59300 4
N 30000 55700 30000 55600 4
N 30000 55600 31600 55600 4
N 31600 55600 31600 57600 4
N 31600 57600 35700 57600 4
N 35700 57600 35700 59700 4
N 28900 58500 29500 58500 4
N 29500 58500 29500 53500 4
N 28900 55700 28900 55000 4
N 28900 55000 29500 55000 4
T 28200 62800 9 24 1 0 0 0 1
MUTE
N 43500 46000 43100 46000 4
N 43100 46000 43100 53500 4
N 43100 53500 29500 53500 4
N 27200 54300 33100 54300 4
C 70200 63600 1 90 0 mono_jack.sym
{
T 69300 64400 5 10 1 1 90 0 1
refdes=CN?
T 68000 64100 5 8 0 0 90 0 1
device=Mono-Jack
}
C 69100 63600 1 90 0 mono_jack.sym
{
T 68200 64400 5 10 1 1 90 0 1
refdes=CN?
T 66900 64100 5 8 0 0 90 0 1
device=Mono-Jack
}
C 72800 59200 1 0 0 mono_jack.sym
{
T 73600 60100 5 10 1 1 0 0 1
refdes=CN?
T 73300 61400 5 8 0 0 0 0 1
device=Mono-Jack
}
N 70000 63600 70000 63300 4
N 68900 63600 68900 63300 4
C 72100 38500 1 0 0 chassis.sym
N 72800 59400 72500 59400 4
N 72300 38800 72500 63300 4
N 66300 59400 66300 63600 4
N 66300 59400 66400 59400 4
N 67400 59700 67300 59700 4
N 67400 59700 67400 63600 4
C 68100 63600 1 90 0 mono_jack.sym
{
T 67200 64400 5 10 1 1 90 0 1
refdes=CN?
T 65900 64100 5 8 0 0 90 0 1
device=Mono-Jack
}
C 67000 63600 1 90 0 mono_jack.sym
{
T 66100 64400 5 10 1 1 90 0 1
refdes=CN?
T 64800 64100 5 8 0 0 90 0 1
device=Mono-Jack
}
N 67900 63600 67900 63300 4
N 66800 63600 66800 63300 4
C 66000 63600 1 90 0 mono_jack.sym
{
T 65100 64400 5 10 1 1 90 0 1
refdes=CN?
T 63800 64100 5 8 0 0 90 0 1
device=Mono-Jack
}
C 64900 63600 1 90 0 mono_jack.sym
{
T 64000 64400 5 10 1 1 90 0 1
refdes=CN?
T 62700 64100 5 8 0 0 90 0 1
device=Mono-Jack
}
N 65800 63600 65800 63300 4
N 64700 63600 64700 63300 4
N 65300 59700 65200 59700 4
N 65300 59700 65300 63600 4
N 64200 59400 64300 59400 4
N 64200 59400 64200 63600 4
C 63900 63600 1 90 0 mono_jack.sym
{
T 63000 64400 5 10 1 1 90 0 1
refdes=CN?
T 61700 64100 5 8 0 0 90 0 1
device=Mono-Jack
}
C 62800 63600 1 90 0 mono_jack.sym
{
T 61900 64400 5 10 1 1 90 0 1
refdes=CN?
T 60600 64100 5 8 0 0 90 0 1
device=Mono-Jack
}
N 63700 63600 63700 63300 4
N 62600 63600 62600 63300 4
N 63200 59700 63100 59700 4
N 63200 59700 63200 63600 4
N 62100 59400 62200 59400 4
N 62100 59400 62100 63600 4
C 61800 63600 1 90 0 mono_jack.sym
{
T 60900 64400 5 10 1 1 90 0 1
refdes=CN?
T 59600 64100 5 8 0 0 90 0 1
device=Mono-Jack
}
C 60700 63600 1 90 0 mono_jack.sym
{
T 59800 64400 5 10 1 1 90 0 1
refdes=CN?
T 58500 64100 5 8 0 0 90 0 1
device=Mono-Jack
}
N 61600 63600 61600 63300 4
N 60500 63600 60500 63300 4
N 61100 59700 61000 59700 4
N 61100 59700 61100 63600 4
N 60000 59400 60100 59400 4
N 60000 59400 60000 63600 4
C 59600 63600 1 90 0 mono_jack.sym
{
T 58700 64400 5 10 1 1 90 0 1
refdes=CN?
T 57400 64100 5 8 0 0 90 0 1
device=Mono-Jack
}
C 58500 63600 1 90 0 mono_jack.sym
{
T 57600 64400 5 10 1 1 90 0 1
refdes=CN?
T 56300 64100 5 8 0 0 90 0 1
device=Mono-Jack
}
N 59400 63600 59400 63300 4
N 58300 63600 58300 63300 4
N 58900 59700 58800 59700 4
N 58900 59700 58900 63600 4
N 57800 59400 57900 59400 4
N 57800 59400 57800 63600 4
C 57500 63600 1 90 0 mono_jack.sym
{
T 56600 64400 5 10 1 1 90 0 1
refdes=CN?
T 55300 64100 5 8 0 0 90 0 1
device=Mono-Jack
}
C 56400 63600 1 90 0 mono_jack.sym
{
T 55500 64400 5 10 1 1 90 0 1
refdes=CN?
T 54200 64100 5 8 0 0 90 0 1
device=Mono-Jack
}
N 57300 63600 57300 63300 4
N 56200 63600 56200 63300 4
N 56800 59700 56700 59700 4
N 56800 59700 56800 63600 4
N 55700 59400 55800 59400 4
N 55700 59400 55700 63600 4
C 55400 63600 1 90 0 mono_jack.sym
{
T 54500 64400 5 10 1 1 90 0 1
refdes=CN?
T 53200 64100 5 8 0 0 90 0 1
device=Mono-Jack
}
C 54300 63600 1 90 0 mono_jack.sym
{
T 53400 64400 5 10 1 1 90 0 1
refdes=CN?
T 52100 64100 5 8 0 0 90 0 1
device=Mono-Jack
}
N 55200 63600 55200 63300 4
N 54100 63600 54100 63300 4
N 54700 59700 54600 59700 4
N 54700 59700 54700 63600 4
N 53600 59400 53700 59400 4
N 53600 59400 53600 63600 4
C 53300 63600 1 90 0 mono_jack.sym
{
T 52400 64400 5 10 1 1 90 0 1
refdes=CN?
T 51100 64100 5 8 0 0 90 0 1
device=Mono-Jack
}
C 52200 63600 1 90 0 mono_jack.sym
{
T 51300 64400 5 10 1 1 90 0 1
refdes=CN?
T 50000 64100 5 8 0 0 90 0 1
device=Mono-Jack
}
N 53100 63600 53100 63300 4
N 52000 63600 52000 63300 4
N 52600 59700 52500 59700 4
N 52600 59700 52600 63600 4
N 51500 59400 51600 59400 4
N 51500 59400 51500 63600 4
C 51200 63600 1 90 0 mono_jack.sym
{
T 50300 64400 5 10 1 1 90 0 1
refdes=CN?
T 49000 64100 5 8 0 0 90 0 1
device=Mono-Jack
}
C 50100 63600 1 90 0 mono_jack.sym
{
T 49200 64400 5 10 1 1 90 0 1
refdes=CN?
T 47900 64100 5 8 0 0 90 0 1
device=Mono-Jack
}
N 51000 63600 51000 63300 4
N 49900 63600 49900 63300 4
N 50500 59700 50400 59700 4
N 50500 59700 50500 63600 4
N 49400 59400 49500 59400 4
N 49400 59400 49400 63600 4
N 49900 63300 72500 63300 4
N 60700 57400 61500 57400 4
N 60700 57400 60700 58700 4
N 58500 57400 59300 57400 4
N 58500 57400 58500 58700 4
