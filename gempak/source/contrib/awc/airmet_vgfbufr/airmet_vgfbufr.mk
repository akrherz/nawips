$(BINDIR)/airmet_vgfbufr: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
			  -lairmet_vgfbufr -lairmet_share -ltextlib \
			  -lcgemlib -lgemlib -lgplt -ldevice -lgn \
			  -lcgemlib -lgemlib -lGPC -lmelBUFR \
			  -lxslt -lxml2 -liconv -lz -lm

