$(BINDIR)/ndfdg2: -lndfdg2 -lgriblib -lgridlib -lgemlib \
		  -lappl -lsyslib -lmdlg2dec \
		  -ltextlib -lgridlib $(PYLIB) -lxslt -lxml2 -liconv -lz -lm 
