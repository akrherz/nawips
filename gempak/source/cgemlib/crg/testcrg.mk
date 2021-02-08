$(BINDIR)/testcrg: $(OS_LIB)/ginitp_alt.o $(OS_LIB)/gendp_alt.o \
		   -lcgemlib -lgemlib -lgplt -ldevice \
		   -lxw -lgn -lcgemlib -lgemlib -lX11 -lm
