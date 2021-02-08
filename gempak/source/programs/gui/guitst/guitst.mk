LOCLIBS := -lnxmlib -lxwp -lxw -lps -lgn
$(BINDIR)/guitst: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		  -lgemlib -lgdplot2 -lgdstream -lgplt -ldevice \
		  $(LOCLIBS) -lcgemlib -lgemlib -lgplt \
		  -ldevice -lcgemlib $(LOCLIBS) $(XLIBS) -lm
