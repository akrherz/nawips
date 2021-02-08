import os
from datetime import datetime
from ufpy import ThriftClient
from dynamicserialize.dstypes.java.util import GregorianCalendar
from dynamicserialize.dstypes.gov.noaa.nws.ncep.common.dataplugin.gempak.request import GetTimesRequest
from dynamicserialize.dstypes.gov.noaa.nws.ncep.common.dataplugin.gempak.request import GetTimesResponse


class TimeRetriever:
    """ Retrieves all requested times"""

    def __init__(self,server,pluginName,timeField):
         self.pluginName = pluginName
         self.timeField = timeField
         self.outdir = os.getcwd()
         self.host = os.getenv("DEFAULT_HOST", server)
         self.port = os.getenv("DEFAULT_PORT", "9581")
         self.client = ThriftClient.ThriftClient(self.host, self.port)

    def getTimes(self):
         """ Sends ThriftClient request and writes out received files."""
         req = GetTimesRequest()
         req.setPluginName(self.pluginName)
         req.setTimeField(self.timeField)
         resp = self.client.sendRequest(req)

	 timelist = []
         for item in resp.getTimes():
             if isinstance(item, GregorianCalendar):
                 tstamp =  item.getTimeInMillis()
             else:
                 tstamp =  item.getTime()
             time = datetime.utcfromtimestamp(tstamp/1000)
	     timelist.append(time)

	 timelist.sort(reverse=True)

	 times = []
         for time in timelist:
	     times.append(9999)
	     times.append( (time.year%100)*10000 + (time.month*100) + time.day )
	     times.append( (time.hour*100) + time.minute )
	 
	 # GEMPAK can only handle up to 200 times, which is 600 elements
	 # in this array -- [9999, DATE, TIME] -- repeated
	 return times[0:600]
             
def gettimes(server,table,key,dummy,dummy2):
    tr = TimeRetriever(server,table,key)
    return tr.getTimes()

# This is the standard boilerplate that runs this script as a main
if __name__ == '__main__':
    import sys 
    # Run Test
    #srv = 'nco-lw-msmith'
    srv = 'nco-lw-sgilbert'

    print ' '
    print 'OBS - METAR'
    tbl = 'obs'
    key = 'refHour'
    print gettimes(srv,tbl,key)

    print ' '
    print 'SFCOBS - SYNOP'
    tbl = 'sfcobs'
    key = 'refHour'
    print gettimes(srv,tbl,key)

    print ' '
    print 'BUFRUA'
    tbl = 'bufrua'
    key = 'dataTime.refTime'
    print gettimes(srv,tbl,key)

    #print ' '
    #print 'BUFRMOS'
    #tbl = 'bufrmos'
    #key = 'refHour'
    #print gettimes(srv,tbl,key)
