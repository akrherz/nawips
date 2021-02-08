$(BINDIR)/sfgram_gf: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lsfgram \
		     -lsflib -lprmcnvlib -lgemlib -lgridlib -lcgemlib \
		     -lgplt -ldevice -lgf -lxw -lgn \
		     -lcgemlib -lgridlib -lgemlib \
		     -lgplt -ldevice -lgf -lxw -lgn \
		     -lcgemlib -lgridlib -lgemlib \
		     -lnetcdf -lX11 \
		     -ltextlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm
