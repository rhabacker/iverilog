#
#    This source code is free software; you can redistribute it
#    and/or modify it in source code form under the terms of the GNU
#    Library General Public License as published by the Free Software
#    Foundation; either version 2 of the License, or (at your option)
#    any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Library General Public License for more details.
#
#    You should have received a copy of the GNU Library General Public
#    License along with this program; if not, write to the Free
#    Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
#    Boston, MA 02110-1301, USA.
#

AUTOMAKE_OPTIONS = foreign subdir-objects

vpidir = $(libdir)/ivl@install_suffix@

AM_CPPFLAGS = \
	-I$(srcdir) \
	-I$(top_srcdir) \
	@file64_support@ \
	@DEFS@ \
	-DICARUS_VPI_CONST=const \
	@PICFLAG@

AM_CFLAGS = \
	@WARNING_FLAGS@ \
	@WARNING_FLAGS_CC@ \
	@CFLAGS@

AM_CXXFLAGS = \
	@WARNING_FLAGS@ \
	@WARNING_FLAGS_CXX@ \
	@CXXFLAGS@

AM_LDFLAGS = @LDFLAGS@

###############################################################################
# libvpi.a
###############################################################################

pkglib_LIBRARIES = libvpi.a

libvpi_a_SOURCES = \
	libvpi.c \
	../vpi_user.h

###############################################################################
# Common sources
###############################################################################

SYSTEM_VPI_SOURCES = \
	mt19937int.c \
	sdf_lexor.c \
	sdf_parse.c \
	stringheap.c \
	sys_convert.c \
	sys_countdrivers.c \
	sys_darray.c \
	sys_deposit.c \
	sys_display.c \
	sys_fileio.c \
	sys_finish.c \
	sys_icarus.c \
	sys_plusargs.c \
	sys_priv.c \
	sys_queue.c \
	sys_random.c \
	sys_random_mti.c \
	sys_readmem.c \
	sys_readmem_lex.c \
	sys_scanf.c \
	sys_sdf.c \
	sys_table.c \
	sys_time.c \
	sys_vcd.c \
	sys_vcdoff.c \
	table_mod.c \
	table_mod_lexor.c \
	table_mod_parse.c \
	vams_simparam.c \
	vcd_priv.cc

if HAVE_LIBZ

if HAVE_LIBBZ2
SYSTEM_VPI_SOURCES += \
	sys_lxt.c \
	lxt_write.c
endif

SYSTEM_VPI_SOURCES += \
	sys_lxt2.c \
	lxt2_write.c \
	sys_fst.c \
	fstapi.c \
	fastlz.c \
	lz4.c

endif

V2005_MATH_SOURCES = \
	sys_clog2.c \
	v2005_math.c

VA_MATH_SOURCES = \
	va_math.c

V2009_SOURCES = \
	v2009_table.c \
	v2009_array.c \
	v2009_bitvec.c \
	v2009_enum.c \
	v2009_string.c \
	sys_priv.c

VHDL_SYS_SOURCES = \
	vhdl_table.c \
	sys_priv.c

VHDL_TEXTIO_SOURCES = \
	vhdl_textio.c \
	sys_priv.c

VPI_DEBUG_SOURCES = \
	vpi_debug.c

###############################################################################
# VPI modules
###############################################################################

vpidir = $(libdir)/ivl@install_suffix@

VPI_COMMON_LIBADD = \
	libvpi.a \
	@LIBS@

VPI_MODULE_LDFLAGS = \
	-module \
	-avoid-version \
	-shrext .vpi

vpi_LTLIBRARIES = \
	system.la \
	va_math.la \
	v2005_math.la \
	v2009.la \
	vhdl_sys.la \
	vhdl_textio.la \
	vpi_debug.la

###############################################################################
# system.vpi
###############################################################################

system_la_SOURCES = $(SYSTEM_VPI_SOURCES)
system_la_LIBADD = $(VPI_COMMON_LIBADD)
system_la_LDFLAGS = $(VPI_MODULE_LDFLAGS)
if MINGW32
system_la_LDFLAGS += @EXTRALIBS@
endif

###############################################################################
# va_math.vpi
###############################################################################


va_math_la_SOURCES = $(VA_MATH_SOURCES)
va_math_la_LIBADD = $(VPI_COMMON_LIBADD)
va_math_la_LDFLAGS = $(VPI_MODULE_LDFLAGS)
if MINGW32
va_math_la_LDFLAGS += @EXTRALIBS@
endif

###############################################################################
# v2005_math.vpi
###############################################################################

v2005_math_la_SOURCES = $(V2005_MATH_SOURCES)
v2005_math_la_LIBADD = $(VPI_COMMON_LIBADD)
v2005_math_la_LDFLAGS = $(VPI_MODULE_LDFLAGS)

###############################################################################
# v2009.vpi
###############################################################################

v2009_la_SOURCES = $(V2009_SOURCES)
v2009_la_LIBADD = $(VPI_COMMON_LIBADD)
v2009_la_LDFLAGS = $(VPI_MODULE_LDFLAGS)

###############################################################################
# vhdl_sys.vpi
###############################################################################

vhdl_sys_la_SOURCES = $(VHDL_SYS_SOURCES)
vhdl_sys_la_LIBADD = $(VPI_COMMON_LIBADD)
vhdl_sys_la_LDFLAGS = $(VPI_MODULE_LDFLAGS)

###############################################################################
# vhdl_textio.vpi
###############################################################################

vhdl_textio_la_SOURCES = $(VHDL_TEXTIO_SOURCES)
vhdl_textio_la_LIBADD = $(VPI_COMMON_LIBADD)
vhdl_textio_la_LDFLAGS = $(VPI_MODULE_LDFLAGS)

###############################################################################
# vpi_debug.vpi
###############################################################################

vpi_debug_la_SOURCES = $(VPI_DEBUG_SOURCES)
vpi_debug_la_LIBADD = $(VPI_COMMON_LIBADD)
vpi_debug_la_LDFLAGS = $(VPI_MODULE_LDFLAGS)

###############################################################################
# Generated sources
###############################################################################

BUILT_SOURCES = \
	vpi_config.h \
	sys_readmem_lex.c \
	sdf_parse.c \
	sdf_parse.h \
	sdf_lexor.c \
	table_mod_parse.c \
	table_mod_parse.h \
	table_mod_lexor.c

CLEANFILES = \
	sys_readmem_lex.c \
	sdf_parse.c \
	sdf_parse.h \
	sdf_parse.output \
	sdf_lexor.c \
	table_mod_parse.c \
	table_mod_parse.h \
	table_mod_parse.output \
	table_mod_lexor.c

DISTCLEANFILES = \
	vpi_config.h \
	stamp-vpi_config-h

###############################################################################
# flex / bison
###############################################################################

sys_readmem_lex.c: $(srcdir)/sys_readmem_lex.lex
	$(AM_V_LEX)$(LEX) -t $< > $@

sdf_lexor.c: $(srcdir)/sdf_lexor.lex
	$(AM_V_LEX)$(LEX) -t $< > $@

table_mod_lexor.c: $(srcdir)/table_mod_lexor.lex
	$(AM_V_LEX)$(LEX) -t $< > $@

# Use explicit grouped targets to avoid parallel build issues.

sdf_parse.c sdf_parse.h: $(srcdir)/sdf_parse.y
	$(AM_V_YACC)$(YACC) --verbose -t -p sdf -d \
		-o sdf_parse.c $<

table_mod_parse.c table_mod_parse.h: \
	$(srcdir)/table_mod_parse.y
	$(AM_V_YACC)$(YACC) --verbose -t -p tblmod -d \
		-o table_mod_parse.c $<

###############################################################################
# Config header
###############################################################################

stamp-vpi_config-h: $(srcdir)/vpi_config.h.in $(top_builddir)/config.status
	cd $(top_builddir) && \
		./config.status --header=vpi/vpi_config.h

vpi_config.h: stamp-vpi_config-h

###############################################################################
# cppcheck
###############################################################################

CPPCHECK_SOURCES = \
	$(SYSTEM_VPI_SOURCES) \
	$(V2005_MATH_SOURCES) \
	$(VA_MATH_SOURCES) \
	$(V2009_SOURCES) \
	$(VHDL_SYS_SOURCES) \
	$(VHDL_TEXTIO_SOURCES) \
	$(VPI_DEBUG_SOURCES)

cppcheck:
	cppcheck --enable=all --std=c99 --std=c++11 -f \
	         --check-level=exhaustive \
	         --suppressions-list=$(top_srcdir)/cppcheck-global.sup \
	         --suppressions-list=$(srcdir)/cppcheck.sup \
	         -UYY_USER_INIT -UYY_LOCATION_PRINT \
	         -Uyyset_out -Uyyset_lineno \
	         -Uyyset_in -Uyyset_extra \
	         -Uyyset_debug -Uyylex_destroy \
	         -Uyyget_text -Uyyget_out \
	         -Uyyget_lineno -Uyyget_leng \
	         -Uyyget_in -Uyyget_extra \
	         -Uyyget_debug \
	         -UYYPARSE_PARAM -UYYPRINT \
	         -Ushort -Uyyoverflow \
	         -UYYTYPE_INT8 -UYYTYPE_INT16 \
	         -UYYTYPE_UINT8 -UYYTYPE_UINT16 \
	         -UYYLTYPE -UYYSTYPE \
	         -U__SIZE_TYPE__ -Umalloc \
	         -Usize_t -Ufree \
	         -U__PTRDIFF_TYPE__ \
	         -UMAP_FAILED \
	         --relative-paths=$(srcdir) \
	         $(AM_CPPFLAGS) \
	         $(CPPCHECK_SOURCES)

.PHONY: cppcheck

###############################################################################
# Remove unwanted libtool install artifacts
###############################################################################

install-exec-hook:
	cd $(DESTDIR)$(vpidir) && \
	rm -f \
		system.a system.la \
		va_math.a va_math.la \
		v2005_math.a v2005_math.la \
		v2009.a v2009.la \
		vhdl_sys.a vhdl_sys.la \
		vhdl_textio.a vhdl_textio.la \
		vpi_debug.a vpi_debug.la
