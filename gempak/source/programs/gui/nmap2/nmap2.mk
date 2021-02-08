ifeq "$(OS)" "AIX"
LDFLAGS += -bmaxdata:0x80000000
else ifeq "$(OS)" "IRIX"
LDFLAFS += -LD_MSG:OFF=171
endif
$(BINDIR)/nmap2: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lnmap2 \
		 -lvflib -lnmaplib -lnmap2 -lnxmlib -lsfmap -lsnmap -lsnlib \
		 -lgdplot2 -lgdmap -lgdstream -lgrphgd -lsflib -lgdcfil \
		 -loabsfc -loalib -lAODT_v64 -lAODT_v72 -ldiaglib -lgemlib \
		 -lprmcnvlib -lgridlib -ltextlib -lcgemlib -lgplt -ldevice \
		 -lxwp -lxw -lps -lgn -lcgemlib -lgemlib -lGPC -lnetcdf $(PYLIB) \
		 $(XLIBS) -lxslt -lxml2 -liconv -lz -lm -lbz2 -lhdf5 -lhdf5_hl  \
	         $(OS_LIB)/libhdf5_hl.so
