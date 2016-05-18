PROGNAME	= griffifree
VERSION		= 1.0

SRCDIR		= src

all: $(PROGNAME)

#SFILES		= xxxx

#OBJFUKES	= $(patsubst %,$(SRCDIR)/%,$(SFILES))
#INCFILES 	= $(patsubst %,$(SRCDIR)/%,$(SFILES))	


CFLAGS_GEN 	= -Wall -funsigned-char -g -ggdb -I/usr/local/include/ \
			 -I/opt/local/include/ $(CFLAGS) -DVERSION=\"$(VERSION)\"

CFLAGS_DBG 	= -DLOG_STDERR=1 -DDEBUG_ALLOCATOR=1 \
		     $(CFLAGS_GEN)

CFLAGS_OPT =  -O3 -Wno-format $(CFLAGS_GEN)

LDFLAGS   += -L/usr/local/lib/ -L/opt/local/lib
LIBS      += -lcrypto -lssl -lidn -lz -lpcre

$(PROGNAME): $(SRCDIR)/$(PROGNAME).c $(OBJFILES) $(INCFILES)
	$(CC) $(LDFLAGS) $(SRCDIR)/$(PROGNAME).c -o $(PROGNAME) \
	$(CFLAGS_OPT) $(OBJFILES) $(LIBS)
	@echo "hello grefifree"
	@echo


debug: $(SRCDIR)/$(PROGNAME).c $(OBJFILES) $(INCFILES)
	$(CC) $(LDFLAGS) $(SRCDIR)/$(PROGNAME).c -o $(PROGNAME) \
	$(CFLAGS_DBG) $(OBJFILES) $(LIBS)
	@echo "hello grefifree"
	@echo

clean:

