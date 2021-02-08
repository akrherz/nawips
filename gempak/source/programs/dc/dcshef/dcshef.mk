$(BINDIR)/dcshef: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
	   -lbridge -lprmcnvlib -lsflib -lsnlib -lOHSHEF -lbridge \
	   -lcgemlib -lncepBUFR -lncepUT -lncepBUFR -lgplt \
	   -ldevice -lgn -lbridge -lcgemlib -lgemlib \
	   -ltextlib -lgemlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm
