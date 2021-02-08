$(BINDIR)/sfgram_gif: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lsfgram \
		      -lsflib -lprmcnvlib -lgemlib -lgridlib -lcgemlib \
		      -lgplt -ldevice -lgif -lgn \
		      -lcgemlib -lgridlib -lgemlib \
		      -lgplt -ldevice -lgif -lgn \
		      -lcgemlib -lgridlib -lgemlib \
		      -lnetcdf $(PYLIB) -ltextlib -lxslt -lxml2 -liconv -lz -lm
