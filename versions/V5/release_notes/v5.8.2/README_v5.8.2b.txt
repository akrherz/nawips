Added the VTEC action code to the WCN decoder, DCWCN

The text output for the WCN decoder, DCWCN, has been modified. The VTEC action 
code for each WCN has been added to the data information string. The VTEC code 
is prepended to the significance code and the two are separated by a semi-colon. 
Please see $GEMHLP/hlp/dcwcn.hlp for more details and examples.


Added new flags to the WOU update program

Added 3 new flags (e,o and u) to WOUPDT. The program determines whether or not
to create a product based upon which flag is used and which action codes are 
found. Updated the final WOU to make a distinction between the SPC or the WFOs 
canceling/expiring a watch.  When the watch expires at it's normal ending time, 
the product code in the VTEC line is 'O' and the action code is 'EXP' with no 
reference to 'EXPERIMENTAL...' in the MND lines. When the watch is canceled 
early by the WFOs, 'EXPERIMENTAL...' is in the MND line and the VTEC product 
code is 'E' and the action code is set to 'CAN'. The '$$' should appear above 
the 'ATTN..WFO...' line.  Updated the woupdt.hlp file with new descriptions.


Made corrections to the update program and WOU display

Corrected errors based on bugs found by the SPC (email 03/11/05).  
The corrections are (1) the EXT from WFO TSA at 1714Z  picked up in the 1716Z 
WOU. Also the 2013Z WCN EXT in the 2016Z WOU. (2) A bad UGC line in the final 
WOU at 2046Z. (3) Have the '$$' above the attention string in the final-WOU. 
(4) If the first line of a decoded WOU contains a watch cancellation and the 
next line was a new WOU, the new WOU would not display in NMAP.


Fixed the WOU-final to include marine zones in state string

Corrected a bug in creating the final WOU update messages. The specific marine 
zones are included in the STZ000-STZ000-...-YYMMDD- string. 


