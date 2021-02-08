$(BINDIR)/gd2ndfd: -lgd2ndfd -ldiaglib -lgemlib -lappl \
		   -lgridlib -lgemlib -lsyslib -lcgemlib -lmdlg2enc \
		   -ltextlib -lgridlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm 
