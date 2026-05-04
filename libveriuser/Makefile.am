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
AM_CPPFLAGS = -I$(top_builddir) -I$(top_srcdir) -I.  -DICARUS_VPI_CONST=const
AM_CFLAGS = @WARNING_FLAGS@ @WARNING_FLAGS_CC@ @PICFLAG@

pkgconfigdir = $(libdir)/pkgconfig

noinst_LIBRARIES = libveriuser.a

libveriuser_a_SOURCES = \
    asynch.c delay.c exprinfo.c finish.c getcstringp.c getinstance.c \
    getlongp.c getp.c getsimtime.c io_print.c math.c mc_scan_plusargs.c \
    nodeinfo.c nump.c putlongp.c putp.c spname.c typep.c workarea.c \
    veriusertfs.c priv.c \
    a_close.c a_compare_handles.c a_configure.c a_fetch_argc.c \
    a_fetch_argv.c a_fetch_dir.c a_fetch_fullname.c a_fetch_location.c \
    a_fetch_param.c a_fetch_range.c a_fetch_tfarg.c a_fetch_time.c \
    a_fetch_type.c a_fetch_type_str.c a_fetch_value.c a_handle_by_name.c \
    a_handle_hiconn.c a_handle_object.c a_handle_parent.c \
    a_handle_simulated_net.c a_handle_tfarg.c a_initialize.c a_next.c \
    a_next_bit.c a_next_port.c a_next_topmod.c a_object_of_type.c \
    a_product_version.c a_set_value.c a_vcl.c a_version.c

pkgconfig_DATA = libveriuser$(install_suffix).pc

cppcheck:
	cd $(srcdir); \
	cppcheck --enable=all --std=c99 --std=c++11 -f \
		--check-level=exhaustive \
		--suppressions-list=../cppcheck-global.sup \
		--suppressions-list=cppcheck.sup \
		-I $(abs_builddir) -I $(abs_top_builddir) -I .. \
		$(libveriuser_a_SOURCES)

install-exec-hook:
	$(INSTALL_DATA) libveriuser.a \
		$(DESTDIR)$(libdir)/libveriuser$(install_suffix).a

uninstall-hook:
	rm -f "$(DESTDIR)$(libdir)/libveriuser$(install_suffix).a"

MAINTAINERCLEANFILES = Makefile.in
