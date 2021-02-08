import os
import sys
from datetime import datetime
from ufpy import ThriftClient
from dynamicserialize.dstypes.com.raytheon.uf.common.time import DataTime
from dynamicserialize.dstypes.com.raytheon.uf.common.time import TimeRange
from dynamicserialize.dstypes.gov.noaa.nws.ncep.common.dataplugin.gempak.request import StationDataRequest
from dynamicserialize.dstypes.gov.noaa.nws.ncep.common.dataplugin.gempak.request import SurfaceDataRequest
from dynamicserialize.dstypes.gov.noaa.nws.ncep.common.dataplugin.gempak.request import UpperAirDataRequest


class StationDataRetriever:
    """ Retrieves all data for a requested station and time """

    def __init__(self,server,pluginName,stationId,refTime,parmList,partNumber):
         self.pluginName = pluginName
         self.stationId = stationId
         self.refTime = refTime
         self.parmList = parmList
         self.partNumber = partNumber
         self.host = os.getenv("DEFAULT_HOST", server)
         self.port = os.getenv("DEFAULT_PORT", "9581")
         self.client = ThriftClient.ThriftClient(self.host, self.port)

#original client request for station data
    def getStationData(self):
         """ Sends ThriftClient request and writes out received files."""
         dtime = datetime.strptime(self.refTime, "%y%m%d/%H%M")
         range = TimeRange()
         range.setStart(dtime)
         range.setEnd(dtime)
         dataTime = DataTime(refTime=dtime, validPeriod=range)
         req = StationDataRequest()
         req.setPluginName(self.pluginName)
         req.setStationId(self.stationId)
         req.setRefTime(dataTime)
         req.setParmList(self.parmList)
         req.setPartNumber(self.partNumber)
         resp = self.client.sendRequest(req)

         return resp

                          
#function to perform a client request for all-stations-at-timestamp surface data
    def getSurfaceData(self):
         """ Sends ThriftClient request and writes out received files."""
         dtime = datetime.strptime(self.refTime, "%y%m%d/%H%M")
         range = TimeRange()
         range.setStart(dtime)
         range.setEnd(dtime)
         dataTime = DataTime(refTime=dtime, validPeriod=range)
         req = SurfaceDataRequest()
         req.setPluginName(self.pluginName)
         req.setStationId(self.stationId)
         req.setRefTime(dataTime)
         req.setParmList(self.parmList)
         req.setPartNumber(self.partNumber)
         resp = self.client.sendRequest(req)

         return resp
                          
#function to perform a client request for all-stations-at-timestamp upper air level data
    def getUpperAirData(self):
         """ Sends ThriftClient request and writes out received files."""
         dtime = datetime.strptime(self.refTime, "%y%m%d/%H%M")
         range = TimeRange()
         range.setStart(dtime)
         range.setEnd(dtime)
         dataTime = DataTime(refTime=dtime, validPeriod=range)
         req = UpperAirDataRequest()
         req.setPluginName(self.pluginName)
         req.setStationId(self.stationId)
         req.setRefTime(dataTime)
         req.setParmList(self.parmList)
         req.setPartNumber(self.partNumber)
         resp = self.client.sendRequest(req)

         return resp
                          
#original function for data retrieval for surface data for a single station
def getstationdata(server,table,stationId,refTime,parmList,partNumber):
    sr = StationDataRetriever(server,table,stationId,refTime,parmList,partNumber)
    lcldict = sr.getStationData()

    rdata = []
    
    for substr in parmList.split(','):
        if substr in lcldict:
            rdata.append(lcldict[substr])
        else:
            rdata.append(-9999.00)

    return rdata
             
#original function for data retrieval for upper air levels data for a single station
def getleveldata(server,table,stationId,refTime,parmList,partNumber):
    sr = StationDataRetriever(server,table,stationId,refTime,parmList,partNumber)
    lcldict = sr.getStationData()

    numset = [1]
    for substr in parmList.split(','):
	if substr in lcldict:
	    pnum = len(lcldict[substr]) - 1
	    while ( pnum >= 0 ):
		if lcldict[substr][pnum] != -9999.00:
		    break
		pnum = pnum - 1
	    numset.append(pnum)

    rdata = []

    for jj in range(max(numset)):
	for substr in parmList.split(','):
	    if substr in lcldict:
		if lcldict[substr][jj] == -9999998.0:
		    rdata.append(-9999.0)
		else:
		    rdata.append(lcldict[substr][jj])
	    else:
		rdata.append(-9999.0)
    
    return rdata

#original function for text retrieval for surface data
def getstationtext(server,table,stationId,refTime,parmList,partNumber):
    sr = StationDataRetriever(server,table,stationId,refTime,parmList,partNumber)
    lcldict = sr.getStationData()

    if parmList in lcldict:
        return lcldict[parmList]
    else:
        return ' '

#original 'header load' function that just returns [0] without messaging
def getheader(server,table,stationId,refTime,parmList,partNumber):
    idata = []
    idata.append(0)
    return idata

#function to retrieve surface data for a single timestamp over all stations
def getsurfacedata(server,table,stationId,refTime,parmList,partNumber):
    sr = StationDataRetriever(server,table,stationId,refTime,parmList,partNumber)
    lcldict = sr.getSurfaceData()
    
    """Data becomes formatted"""
    """(<stationid>,<param size>,<param value>|<list of param values>,....)"""

    rdata = []
    
    for station in lcldict:
        rdata.append(station)
        params = lcldict[station]
        for substr in parmList.split(','):
            if substr in params:
                if (isinstance(params[substr], list)):
                    length = len(params[substr])
                    pnum = length - 1
                    while ( pnum >= 0 ):
                        if (params[substr][pnum] != -9999.00):
                            break
                        pnum = pnum - 1
                    
                    rdata.append(pnum + 1)
                    
                    """ need to handle 0-length case (empty list) """
                    if ((pnum + 1) > 0):
                        for jj in range(pnum + 1):
                            if (params[substr][jj] == -9999998.0):
                                rdata.append(-9999.0)
                            else:
                                rdata.append(params[substr][jj])
                    else:
                        rdata.append(-9999.0)
                else:
                    rdata.append(0)
                    rdata.append(params[substr])
            else:
                rdata.append(0)
                rdata.append(-9999.00)
    
    return rdata

#function to retrieve upper air level data for a single timestamp over all stations
def getupperairdata(server,table,stationId,refTime,parmList,partNumber):
    sr = StationDataRetriever(server,table,stationId,refTime,parmList,partNumber)
    lcldict = sr.getUpperAirData()
    
    """Data becomes formatted"""
    """(<stationid>,<param size>,<param value>|<list of param values>,....)"""

    rdata = []
    
    for station in lcldict:
        rdata.append(station)
        params = lcldict[station]
        for substr in parmList.split(','):
            if substr in params:
                if (isinstance(params[substr], list)):
                    length = len(params[substr])
                    pnum = length - 1
                    while ( pnum >= 0 ):
                        if (params[substr][pnum] != -9999.00):
                            break
                        pnum = pnum - 1
                    
                    rdata.append(pnum + 1)
                    
                    """ need to handle 0-length case (empty list) """
                    if ((pnum + 1) > 0):
                        for jj in range(pnum + 1):
                            if (params[substr][jj] == -9999998.0):
                                rdata.append(-9999.0)
                            else:
                                rdata.append(params[substr][jj])
                    else:
                        rdata.append(-9999.0)
                else:
                    rdata.append(0)
                    rdata.append(params[substr])
            else:
                rdata.append(0)
                rdata.append(-9999.00)
    
    return rdata




# This is the standard boilerplate that runs this script as a main
# this does not include test code for the new METAR/UAIR functionality
if __name__ == '__main__':
    # Run Test
    #srv = 'nco-lw-msmith'
    srv = 'nco-lw-pmoyer'
    key = '-'
    
    print ' '
    print 'OBS - METAR'
    tbl = 'obs'
    #stn = 'KBWI'
    #time = '130823/0600'
    stn = 'KLGA'
    time = '130823/1700'
    parm = 'seaLevelPress,temperature,dewpoint,windSpeed,windDir'
    part = '0'
    print getheader(srv,tbl,stn,time,parm,part)
    print getstationdata(srv,tbl,stn,time,parm,part)
    parm = 'rawMETAR'
    print getstationtext(srv,tbl,stn,time,parm,part)

    print ' '
    print 'SFCOBS - SYNOP'
    tbl = 'sfcobs'
    stn = '72403'
    time = '130823/1800'
    parm = 'seaLevelPress,temperature,dewpoint,windSpeed,windDir'
    part = '0'
    print getheader(srv,tbl,stn,time,parm,part)
    print getstationdata(srv,tbl,stn,time,parm,part)
    parm = 'rawReport'
    print getstationtext(srv,tbl,stn,time,parm,part)

    print ' '
    print 'UAIR'
    tbl = 'bufrua'
    #stn = '72403'
    stn = '72469'
    time = '130823/1200'
    #parm = 'numMand,prMan,htMan,tpMan,tdMan,wdMan,wsMan'
    parm = 'prMan,htMan,tpMan,tdMan,wdMan,wsMan'
    part = '2020'
    print getleveldata(srv,tbl,stn,time,parm,part)
    parm = 'prSigT,tpSigT,tdSigT'
    part = '2022'
    print getleveldata(srv,tbl,stn,time,parm,part)
    parm = 'htSigW,wsSigW,wdSigW'
    part = '2021'
    print getleveldata(srv,tbl,stn,time,parm,part)
