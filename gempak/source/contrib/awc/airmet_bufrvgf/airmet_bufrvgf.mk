$(BINDIR)/airmet_bufrvgf: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
			  -lairmet_bufrvgf -lairmet_share -ltextlib \
			  -lgemlib -lgplt -ldevice -lgn -lcgemlib \
			  -lgemlib -lGPC -lmelBUFR -lxslt -lxml2 \
			  -liconv -lz -lm
