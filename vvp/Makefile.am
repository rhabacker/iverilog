AM_CPPFLAGS = \
    -I$(srcdir) \
    -I$(srcdir)/.. \
    -I. \
    -I.. \
    -DICARUS_VPI_CONST=const \
    -DIVL_SUFFIX='"$(install_suffix)"' \
    -DMODULE_DIR1='"$(libdir)/ivl$(install_suffix)"'

AM_CXXFLAGS = @WARNING_FLAGS@ @WARNING_FLAGS_CXX@ @PICFLAG@

ivlincludedir = $(includedir)/iverilog$(install_suffix)
pkgconfigdir = $(libdir)/pkgconfig

BUILT_SOURCES = parse.cc parse.hh lexor.cc
AM_YFLAGS = --verbose -t -d

libvvp_common_SOURCES = \
	vpi_modules.cc vpi_bit.cc vpi_callback.cc vpi_cobject.cc vpi_const.cc vpi_darray.cc \
	vpi_event.cc vpi_iter.cc vpi_mcd.cc \
	vpi_priv.cc vpi_scope.cc vpi_real.cc vpi_signal.cc vpi_string.cc vpi_tasks.cc vpi_time.cc \
	vpi_vthr_vector.cc vpip_bin.cc vpip_hex.cc vpip_oct.cc \
	vpip_to_dec.cc vpip_format.cc vvp_vpi.cc \
	lib_main.cc \
	parse.yy parse_misc.cc lexor.ll arith.cc array_common.cc array.cc bufif.cc compile.cc \
	concat.cc dff.cc class_type.cc enum_type.cc extend.cc file_line.cc latch.cc npmos.cc part.cc \
	permaheap.cc reduce.cc resolv.cc \
	sfunc.cc stop.cc \
	substitute.cc \
	symbols.cc ufunc.cc codes.cc vthread.cc schedule.cc \
	statistics.cc tables.cc udp.cc vvp_island.cc vvp_net.cc vvp_net_sig.cc \
	vvp_object.cc vvp_cobject.cc vvp_darray.cc event.cc logic.cc delay.cc \
	words.cc island_tran.cc

noinst_LTLIBRARIES = libvvp_core.la
libvvp_core_la_SOURCES = $(libvvp_common_SOURCES)
libvvp_core_la_CPPFLAGS = $(AM_CPPFLAGS)

if ENABLE_LIBVVP
lib_LTLIBRARIES = libvvp.la
libvvp_la_SOURCES =
libvvp_la_LIBADD = libvvp_core.la
libvvp_la_LDFLAGS = \
    -no-undefined \
    -version-info @LIBVVP_VERSION_INFO@ \
    @LIBRARY_RELEASE_SUFFIX@

pkgconfig_DATA = libvvp$(install_suffix).pc
endif

lexor.cc: lexor.ll
	$(LEX) -s -o$@ $<

BUILT_SOURCES += tables.cc

tables.cc: draw_tt$(EXEEXT)
	./draw_tt$(EXEEXT) > $@

noinst_PROGRAMS = draw_tt
draw_tt_SOURCES = draw_tt.c

bin_PROGRAMS = vvp
vvp_SOURCES = main.cc
vvp_LDADD =
if ENABLE_LIBVVP
vvp_LDADD += libvvp.la
else
vvp_LDADD += libvvp_core.la
endif
vvp_LDADD += $(LIBS)

ivlinclude_HEADERS = libvvp.h

CLEANFILES =
if HAVE_MAN
man1_MANS = vvp$(install_suffix).1
BUILT_SOURCES += $(man1_MANS)
CLEANFILES += $(man1_MANS)
endif

if WIN32
if HAVE_PS2PDF
pdf_DATA = vvp$(install_suffix).pdf
BUILT_SOURCES += $(pdf_DATA)
CLEANFILES += vvp$(install_suffix).ps $(pdf_DATA)
endif
endif


# --- pattern rules (reusable) ---

if HAVE_MAN
%.ps: %.1
	$(AM_V_GEN)$(MAN) -l -t $< > $@ || rm -f $@
endif

if HAVE_PS2PDF
%.pdf: %.ps
	$(AM_V_GEN)$(PS2PDF) $< $@ || rm -f $@
endif
