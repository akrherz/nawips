CFLAGS += -DUSE_JPEG2000 -DUSE_PNG
ifeq "$(OS)" "AIX"
CFLAGS += -qcpluscmt
endif
