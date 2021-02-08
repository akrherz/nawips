ifeq "$(OS)" "HPUX"
LDFLAGS += +U77
endif
$(BINDIR)/woupdt: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o -lwoupdt \
		  -lgemlib -lvflib -lprmcnvlib -lbridge -lgplt -ldevice -lgn \
		  -ltextlib -lcgemlib -lgplt -lgemlib \
		  -ltextlib -lxslt -lxml2 -liconv -lz -lm
