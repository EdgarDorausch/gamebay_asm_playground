BUILDDIR=./build/
TARGETS := hello-world


build: $(BUILDDIR)/$(TARGETS).gb
$(BUILDDIR):
	# make directory
	mkdir -p $@

$(BUILDDIR)/%.o: %.asm | $(BUILDDIR)
	# compile
	rgbasm -L -o $@ $<

$(BUILDDIR)/%.gb: $(BUILDDIR)/%.o | $(BUILDDIR)
	# link
	rgblink -o $@ $<

	# fix rom
	rgbfix -v -p 0xFF $@
