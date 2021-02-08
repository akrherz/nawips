$(BINDIR)/gpanot_vg:  $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		     -lgpanot -lgemlib -lgridlib  \
		     -lgemlib -ltextlib $(PYLIB) -lxslt -lxml2 -liconv \
		     -lsyslib -lnetcdf -lbz2 -lgplt -lgemlib -ldevice \
		     -lvg -lgn -lgemlib -lcgemlib -lgplt -lgemlib \
		     -lhdf5_hl -lhdf5 -lz -ldl -lm
