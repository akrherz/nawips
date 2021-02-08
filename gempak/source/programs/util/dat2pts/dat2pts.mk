ifeq "$(OS)" "HPUX"
    LDFLAGS += +U77
endif
$(BINDIR)/dat2pts: -ldat2pts -lappl -lgemlib -lsyslib
