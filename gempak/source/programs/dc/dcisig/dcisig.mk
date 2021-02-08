$(BINDIR)/dcisig: -lbridge -lsflib -lsnlib -lcgemlib -lgemlib -lprmcnvlib $(PYLIB) \
    		  -lxslt -lxml2 -liconv -lz -lm
