import os
import numpy
from datetime import datetime
from ufpy import ThriftClient
from dynamicserialize.dstypes.gov.noaa.nws.ncep.common.dataplugin.gempak.request import GetGridDataRequest

class GridDataRetriever:

    def __init__(self,server,pluginName,modelId,cycle,forecast,level1,level2,vcoord,param,nx,ny):
         self.pluginName = pluginName
	 self.modelId = modelId
	 self.cycle = cycle
	 self.forecast = forecast
	 self.level1 = level1
	 self.level2 = level2
	 self.vcoord = vcoord
	 self.param = param
	 self.nx = nx
	 self.ny = ny
         self.host = os.getenv("DEFAULT_HOST", server)
         self.port = os.getenv("DEFAULT_PORT", "9581")
         self.client = ThriftClient.ThriftClient(self.host, self.port)

    def getData(self):
	""" Sends ThriftClient request and writes out received files."""
	req = GetGridDataRequest()

	req.setPluginName(self.pluginName)
	req.setModelId(self.modelId)

	dt = datetime.strptime(self.cycle, '%y%m%d/%H%M')
	ct = datetime.strftime(dt, '%Y-%m-%d %H:%M:%S')
	req.setReftime(ct)
	req.setFcstSec(self.forecast)

	if self.level1 == '-1':
	    f1 = -999999.0
	else:
	    f1 = float(self.level1)

	if self.level2 == '-1':
	    f2 = -999999.0
	else:
	    f2 = float(self.level2)

	vcd = self.vcoord
	if vcd == 'SGMA':
	    if f1 >= 0.0:
		f1 = f1 / 10000
	    if f2 >= 0.0:
		f2 = f2 / 10000
	elif vcd == 'DPTH':
	    if f1 >= 0.0:
		f1 = f1 / 100.0
	    if f2 >= 0.0:
		f2 = f2 / 100.0
	elif vcd == 'POTV':
	    if f1 >= 0.0:
		f1 = f1 / 1000.0
	    if f2 >= 0.0:
		f2 = f2 / 1000.0

	req.setLevel1(str(f1))
	req.setLevel2(str(f2))
	req.setVcoord(vcd)

	req.setParm(self.param)

	resp = self.client.sendRequest(req)

	# Get the dimensions of the grid
	kx = int(self.nx)
	ky = int(self.ny)
	kxky = kx * ky

	# Put the data into a NUMPY array
	grid = numpy.asarray(resp.getFloatData())
	
	# All grids need to be flipped from a GEMPAK point of view
	# Reshape the array into 2D
	grid = numpy.reshape(grid, (ky,kx))
	# Flip the array in the up-down direction
	grid = numpy.flipud(grid)
	# Reshape the array back into 1D
	grid = numpy.reshape(grid, (kxky))

	return [replacemissing(x) for x in grid]

def getgriddata(server,table,model,cycle,forecast,level1,level2,vcoord,param,nx,ny):
    gir = GridDataRetriever(server,table,model,cycle,forecast,level1,level2,vcoord,param,nx,ny)
    return gir.getData()

def getheader(server,table,model,cycle,forecast,level1,level2,vcoord,param,nx,ny):
    idata = []
    idata.append(0)
    idata.append(0)
    return idata

def replacemissing(x):
    if x == -999999.0:
	return -9999.0
    return x
             
# This is the standard boilerplate that runs this script as a main
if __name__ == '__main__':
    import sys 
    # Run Test
    srv = 'ec'
    #srv = 'nco-lw-msmith'
    #srv = 'nco-lw-sgilbert'
    tbl = 'grid'

    mdl = 'GFS230'
    #cyc = '131101/0600'
    cyc = '131227/0000'

    #mdl = 'nam'
    #cyc = '130823/0000'

    #fcs = '108000'
    fcs = '43200'
    lv1 = '500'
    lv2 = '-1'
    vcd = 'PRES'
    prm = 'HGHT'
    nx  = '720'
    ny  = '361'

    #mdl = 'ETA218'
    #cyc = '080420/0000'
    #fcs = '118800'
    #lv1 = '0'
    #lv2 = '-1'
    #vcd = 'NONE'
    #prm = 'WXTZ'

    print getheader(srv,tbl,mdl,cyc,fcs,lv1,lv2,vcd,prm,nx,ny)
    print getgriddata(srv,tbl,mdl,cyc,fcs,lv1,lv2,vcd,prm,nx,ny)
