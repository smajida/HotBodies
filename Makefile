# Makefile.  Generated from Makefile.in by configure.

srcdir = .


package = hotbodies
version = 0.1
tarname = hotbodies
distdir = $(tarname)-$(version)

prefix = /usr/local
exec_prefix = ${prefix}
bindir = ${exec_prefix}/bin

all check clean hotbodies:
	$(MAKE) -C src $@

dist: $(distdir).tar.gz

$(distdir).tar.gz: FORCE $(distdir)
	tar chof - $(distdir) |\
	  gzip -9 -c >$(distdir).tar.gz
	rm -rf $(distdir)

$(distdir):
	mkdir -p $(distdir)/src
	cp configure $(distdir)
	cp Makefile.in $(distdir)
	cp src/Makefile.in $(distdir)/src

distcheck: $(distdir).tar.gz
	gzip -cd $+ | tar xvf -
	$(MAKE) -C $(distdir) all clean
	rm -rf $(distdir)
	@echo "*** Package $(distdir).tar.gz ready for distribution."

Makefile: Makefile.in config.status
	./config.status $@

config.status: configure
	./config.status --recheck

FORCE:
	-rm $(distdir).tar.gz &> /dev/null
	-rm -rf $(distdir) &> /dev/null

.PHONY: FORCE all clean dist distcheck check
