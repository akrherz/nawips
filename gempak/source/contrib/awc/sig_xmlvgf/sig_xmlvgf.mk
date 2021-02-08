$(BINDIR)/sig_xmlvgf: $(OS_LIB)/gendp_alt.o \
			$(OS_LIB)/ginitp_alt.o \
			-lxml_share -lgemlib -lgplt -ldevice -lgn -lcgemlib \
			-lgemlib -lGPC -lxslt -lxml2 -liconv -lz -lm
