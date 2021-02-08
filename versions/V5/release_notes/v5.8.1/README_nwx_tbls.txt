
The following information is needed to install and set up the changes for NWX
to meet the Communications Identifiers final state implementation. The first
4 steps below may be done prior to the implementation date of 11/9/04. The
last step is to be done on 11/9/04.



This README_nwx_tbls.txt file provides the information needed for unpacking the
updated NWX tables (*.bull), pqact.conf, scour.conf, guidata.tbl and master.tbl.
These new NWX tables were derived from the CID combined_phase.xls tables found at: 
		http://www.nws.noaa.gov/datamgmt/cid.html.  

These tables are named after the 3 character product identifier (NNN). At the 
bottom of this file is a complete listing of the new nwx table files provided 
in the tar file. All of the products below are not listed in the new 
guidata.tbl and the new master.tbl.


		      STEPS FOR INSTALLING NEW TABLES
-------------------------------------------------------------------------------

STEP 1 - UNPACKING THE TABLES TAR FILE
======
To unpack the tar file: nwx_cid_updt.tar, copy the tar file to $NAWIPS.
Once in $NAWIPS, type:

        uncompress nwx_cid_updt.tar.Z
then:
	tar xvf nwx_cid_updt.tar


This command unpacks the tar file: nwx_cid_updt.tar into the correct
subdirectories. The new tables are listed below with their full names next to
the file name. The 3 character product identifier is being used for the new
table names.

STEP 2 - EDIT NEW TABLES 
======
The new tables will have to be edited for locally added product changes.

STEP 3 - CONFIGURATION MANAGEMENT CHANGES 
======

The .cshrc and .profile files need to be modified for these products to be seen
in NWX. A a new search path for the products needs to be added.
In .cshrc_data, if $TEXT_DATA is defined as:

	setenv TEXT_DATA     $NADATA1/ldm/nwx

then add the environment variable $TEXT_DATA2 as:

	setenv TEXT_DATA2    $NADATA1/ldm/newnwx

Similarly in .profile_data, add:

	TEXT_DATA2=$NADATA1/ldm/newnwx
	export TEXT_DATA2

STEP 4 - MODIFY pqact.conf and scour.conf
======

A. The current LDM file, pqact.conf will have to be modified. Insert the new 
file, pqact.conf.new into the current pqact.conf file. These changes may be 
inserted after the current listing of NWX products.

B. The current LDM file, scour.conf will have to be modified. Insert the new 
file, scour.conf.new into the current scour.conf file. These changes may be 
inserted at the end of the file.

STEP 5 - Wait for 11/09/04
======
On November 9, 2004 at 1600 UTC, the final all-encompassing phase of the CIDs
will be implemented. If November 9 is declared a critical weather day, the 
implementation will be delayed until the next alternate date of November 16.

To view these products in NWX, run the script: 

	    		copy_tables.csh

This script saves the guidata.tbl and the master.tbl to guidata.tbl.old and 
master.tbl.old, respectively. It then copies guidata.tbl.new to guidata.tbl
and master.tbl.new to master.tbl.

If this script has been run prior to the implementation time and a critical 
weather day has been declared, running the script:

			undo_copy_tbls.csh

will copy the files back to their appropriate names. All other previous changes
can remain without any effect to NWX.

==============================================================================
			CID tables for NWX. 

ada.bull - Alarm/Alert Admin. Message (Urgent Notification)
adm.bull - Alert Admin Message
adr.bull - NWS Admin Message ( External )
adx.bull - Admin Alert for Non-receipt of Transmission
afd.bull - Area Forecast Discussions
afm.bull - Area Forecast Matrices
afp.bull - Area Forecast Product
agf.bull - Agriculture Forecast
ago.bull - Agriculture Observations
apg.bull - Air Stagnation Guidance Narrative
aqi.bull - Air Quality Index Statement
asa.bull - Air Stagnation Advisory
ava.bull - Avalanche Watch
avm.bull - Avalanche Verification Matrix
avw.bull - Avalanche Warning
awg.bull - National Attack Warning
aws.bull - Area Weather Summary
awu.bull - Area Weather Update
aww.bull - Aviation Weather Warning
cae.bull - Child abduction emergency
ccf.bull - Coded City Forecast
cdw.bull - Civil Danger Warning
cem.bull - Civil Emergency Message
cf6.bull - WFO Daily Climate Web Page Messages
cfw.bull - Coastal Flood Warnings, Watches or Statements
chg.bull - Computer Hurricane Guidance
cli.bull - Climatological Report (Daily)
clm.bull - Climatological Report (Misc, including monthly reports)
cmm.bull - Coded Climatotogical Monthly Means
cod.bull - Coded Analysis and Forecasts
cwf.bull - Coastal Waters Forecast
dsa.bull - Unumbered Depression/Suspicious Area Advisory
efp.bull - 3 to 5 Day Extended Forecast
eol.bull - Average 6 to 10 Day Weather Outlook (Local)
eon.bull - Average 6 to 10 Day Weather Outlook (National)
eqr.bull - Earthquake report
eqw.bull - Earthquake warning
esf.bull - Flood Potential Outlook
esg.bull - Extended Streamflow Guidance
esp.bull - Extended Streamflow Prediction
ess.bull - Water Supply Outlook
evi.bull - Evacuation Immediate
fa0.bull - Aviation Area forecast (Pacific)
fa1.bull - Aviation Area forecast (Northeast US)
fa8.bull - Aviation Area forecast (Anchorage AK) 
fa9.bull - Aviation Area forecast (Fairbanks AK) 
faa.bull - Aviation Area forecast (All_Regions) 
fan.bull - AVN based MOS guidance                    
fdi.bull - Fire Danger Indices
ffa.bull - Flash Flood Watch
ffg.bull - Flash Flood Guidance
ffh.bull - Headwater Guidance
ffs.bull - Flash Flood Statement
ffw.bull - Flash Flood Warning
fln.bull - National Flood summary
fls.bull - Flood Statement
flw.bull - Flood Warning
fmr.bull - Forecast Medium Range Guidance
foh.bull - ETA FOUS freezing and relative humidity
frh.bull - ETA FOUS Relative Humidity/Temperature Guidance
frw.bull - Fire Warning
ftj.bull - FOUS Trajectory Forecast
ftm.bull - WSM-88 Radar Outage Notification/Free Text Message
ftp.bull - FOUS prog max/min temp/pop guidance
fwa.bull - Fire Weather Admin. Message
fwc.bull - FOUS Wind/Cloud Guidance
fwe.bull - Extenced Fire Weather Outlook
fwf.bull - Routine Fire Wx Fcst (with/without 6-10 day outlook)
fwl.bull - Land management forecasts
fwm.bull - Misc. Fire Weather Product
fwn.bull - Fire Weather Notification
fwo.bull - Fire Weather Observation
fws.bull - Supression Forecast
fww.bull - Fire Weather Watch
fzl.bull - Freezing Level Forecast
glf.bull - Great Lakes Forecast 
gls.bull - Great Lakes Storm Summary
gsm.bull - General Status Message
hcm.bull - Hydrometeorological Coordination Message
hls.bull - Hurricane Local Statement
hmd.bull - Hydrometeorological Discussion
hmw.bull - Hazardous Materials Warning
hsf.bull - High seas forecast
hwo.bull - Hazardous Weather Outlook
hyd.bull - Daily Hydrometeorological Products
hym.bull - Monthly Hydrometeorological Plain Language Products
hyw.bull - Weekly Hydrometeorological Plain Language Products
ice.bull - Ice Forecast
ini.bull - Administr [NOUS51 KWBC]
iob.bull - Ice Observations
lae.bull - Local Area Emergency
lco.bull - Local cooperative observations
lew.bull - Law Enforcement Warning
lfp.bull - Local Forecast
lsh.bull - Lakeshore Waring or Statement
lsr.bull - Local Storm Report
map.bull - Mean Areal Precip
mav.bull - MOS Aviation-Based Guidance From AVN Model
maw.bull - Ammended Marine Forecast
mef.bull - AFOS Forecast Verification Matrix
met.bull - ETA-Based MOS Alphanumeric Message
mex.bull - MOS Extended-Range Guidance From MRF Model
mim.bull - Marine Interpretation Message
mis.bull - Misc. Local Product
mis_avn.bull - Misc. Aviation Products
mon.bull - Routine Space Environment Product Issued Monthly
mrm.bull - Missing Radar Message (WSR-88D)
mrp.bull - Techniques Development Laboratory Marine Product
mvf.bull - Marine Verification Coded Forecast
mws.bull - Marine Weather Statement
nla.bull - Radar low layer composite reflectivity ap RMVD id 67/ARP
nll.bull - Radar low layer composite reflectivity max id 65/LRM
nml.bull - Radar middle layer composite reflectivity max id 66/LRM
now.bull - Short term forecast
npw.bull - Non-precip warnings, watches, advisories
nsh.bull - Nearshore marine forecast
ntp.bull - Radar storm total precipitation accumulation 80/STP
nuw.bull - Nuclear power plant warning
oav.bull - Other Aviation Products
ocd.bull - Oceanographic Data
off.bull - Offshore Forecast
omr.bull - Other Marine Products
opu.bull - Other Public Products
osw.bull - Ocean Surface Winds
par.bull - Performance Accompliment Report
pbf.bull - Prescribed Burn Forecast
pfm.bull - Point Forecast Matrices
pls.bull - Plain Language Ship Report
pmd.bull - Prognostic Meteorological Discussion
pns.bull - Public Information Statement
psh.bull - Post Storm Hurricane Report
pvm.bull - Public Verification Matrix
qpf.bull - QPF - PTR, RSA and STR Product
qpfpfd.bull - Quantitavive Precipitation Forecast Discussion
qpferd.bull - Quantitavive Precipitation Excess Rainfall
qpfhsd.bull - Quantitavive Precipitation Heavy Snowfall
qps.bull - Quantitavive Precipitation Statement
rdf.bull - Revised Digital Forecast
rdg.bull - Revised Digital Guidance
rec.bull - Recreational Report
rer.bull - Record Report
rfd.bull - Rangeland Fire Danger Forecast
rfr.bull - Route Forecast
rfw.bull - Red Flag Warning
rhw.bull - Radiological Hazard Warning
rr1.bull - Hydrology-Meteorology Data Report Part 1
rr2.bull - Hydrology-Meteorology Data Report Part 2
rr3.bull - Hydrology-Meteorology Data Report Part 3
rr4.bull - Hydrology-Meteorology Data Report Part 4
rr5.bull - Hydrology-Meteorology Data Report Part 5
rr6.bull - ASOS Shef Precip Criteria Message Commissioned
rr7.bull - ASOS Shef Hourly Routine Message Commissioned
rr8.bull - Hydrology-Meteorology Data Report Part 8
rr9.bull - Hydrology-Meteorology Data Report Part 9
rra.bull - Automated Hydrologic Observation Station Report (AHOS)
rrm.bull - Misc. Hydrology Data
rtp.bull - Regional Max/Min Temp and Precip Table
rva.bull - River Summary 
rvd.bull - Daily River Forecast
rvf.bull - River Forecast
rvi.bull - River Ice Statement 
rvm.bull - Misc. River Product
rvr.bull - River Recreation Statement 
rvs.bull - River Statement
rws.bull - Regional weather summary
rzf.bull - Regional zone forecast
sab.bull - Snow Avalanche Bulletin
sad.bull - Daily Surface Aviation Weather Summary
saf.bull - Special Agri Wx Fcst/Advisory/Flying Farmer Fcst Outlook
sag.bull - Snow Avalanche Guidance
sam.bull - Monthly Surface Aviation Weather Summary
scc.bull - Storm Summary
scd.bull - Supplementary Climatological Data (ASOS)
scp.bull - Satellite Cloud Product
scs.bull - Selected Cities Summary
scv.bull - Satellite areal extent of snow cover
sds.bull - Special Dispersion Statement
sfp.bull - State Forecast
sft.bull - Tabular State Forecast
sig.bull - International Sigment/Convective Sigmet
sim.bull - Satellite Interpretattion Message
sls.bull - Severe Local Storm Watch and Areal Outline
smf.bull - Smoke Management Weather Forecast
smw.bull - Special Marine Warning
sps.bull - Special Weather Statement
spw.bull - Shelter In Place Warning
srf.bull - Surf Forecast
sta.bull - Network and Severe Weather Statistical Summaries
sto.bull - Road Condition Report (State Agencies)
stp.bull - State Max/Min Temp and Precip Table
stq.bull - Spot Forecast request
svr.bull - Severe Thunderstorm Warning
svs.bull - Severe Weather Statement
swe.bull - Est. Snow Water Equivalent by Basin
swr.bull - State Weather Roundup
taf.bull - Terminal Aerodrome Forecast
tav.bull - Travelers Forecast Table
tca.bull - Tropical Cyclone Advisory
tcd.bull - Tropical Cyclone Discussion
tce.bull - Tropical Cyclone Position Estimate
tcm.bull - Marine/aviation Tropical Cyclone Advisory
tcp.bull - Public Tropical Cyclone Advisory
tcs.bull - Satellite Tropical Cyclone Summary
tcu.bull - Tropical Cyclone Update
tid.bull - Tide report
tma.bull - Tsunami Tide/Seismic Message Acknowledgement
toe.bull - 911 Telephone Outage Emergency
tor.bull - Tornado Warning
tpt.bull - Temp./Precip/table (National and International)
tsm.bull - Tsunami Tide/Seismic Message
tsu.bull - Tsunami Watch/Warning
tvl.bull - Travelers Forecast
twb.bull - Transcribed Weather Broadcast
twd.bull - Tropical Weather Discussion
two.bull - Tropical Weather Outlook and Summary
tws.bull - Tropical Weather Summary
uvi.bull - UVI
vaa.bull - Volcanic Activity Advisory
ver.bull - Forecast Verification Statistics
vow.bull - Volcano Warning
wa0.bull - Airmet (Pacific)
wa1.bull - Airmet (Northeast US)
wa7.bull - Airmet (Juneau, AK)
wa8.bull - Airmet (Anchorage, AK)
wa9.bull - Airmet (Fairbanks, AK)
waa.bull - Airmet (All_Regions)
wcn.bull - Watch County Notification
wcr.bull - Weekly Weather and Crop Report
wda.bull - Weekly Data for Agriculture
ws0.bull - Sigmet (Pacific)
ws1.bull - Sigmet (Northeast US)
ws7.bull - Sigmet (Juneau AK)
ws8.bull - Sigmet (Anchorage AK) 
ws9.bull - Sigmet (Fairbanks AK) 
wsa.bull - Sigmet (All_Regions) 
wst.bull - Tropical Cyclone Sigmet
wsv.bull - Volcanic Activity Sigmet
wsw.bull - Winter Weather Warnings, Watches, Advisories
wvm.bull - Warning Verification Message
zfp.bull - Zone Forecast Product

