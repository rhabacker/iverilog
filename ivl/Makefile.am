## Process this file with automake to produce Makefile.in

AM_CPPFLAGS = @DEFS@ \
	-I. -I$(top_srcdir) -I$(top_srcdir)/libmisc \
	$(if $(filter .,@srcdir@),,-I$(srcdir)) \
	@CPPFLAGS@

AM_CFLAGS = @WARNING_FLAGS@ @WARNING_FLAGS_CC@ @PICFLAG@
AM_CXXFLAGS = @WARNING_FLAGS@ @WARNING_FLAGS_CXX@ @PICFLAG@

pkglibexecdir = $(libdir)/ivl$(suffix)
pkglibexec_PROGRAMS = ivl

ivl_SOURCES = \
	main.cc async.cc design_dump.cc discipline.cc dup_expr.cc \
	elaborate.cc elab_expr.cc elaborate_analog.cc elab_lval.cc \
	elab_net.cc elab_scope.cc elab_sig.cc elab_sig_analog.cc \
	elab_type.cc emit.cc eval_attrib.cc eval_tree.cc \
	expr_synth.cc functor.cc lexor.cc lexor_keyword.cc \
	link_const.cc load_module.cc netlist.cc netmisc.cc \
	nettypes.cc net_analog.cc net_assign.cc net_design.cc \
	netclass.cc netdarray.cc netenum.cc netparray.cc \
	netqueue.cc netscalar.cc netstruct.cc netvector.cc \
	net_event.cc net_expr.cc net_func.cc net_func_eval.cc \
	net_link.cc net_modulo.cc net_nex_input.cc \
	net_nex_output.cc net_proc.cc net_scope.cc \
	net_tran.cc net_udp.cc map_named_args.cc \
	pad_to_width.cc parse.cc parse_misc.cc pform.cc \
	pform_analog.cc pform_disciplines.cc pform_dump.cc \
	pform_package.cc pform_pclass.cc pform_types.cc \
	symbol_search.cc sync.cc sys_funcs.cc verinum.cc \
	verireal.cc vpi_modules.cc target.cc \
	Attrib.cc HName.cc Module.cc PClass.cc \
	PDelays.cc PEvent.cc PExpr.cc PFunction.cc \
	PGate.cc PGenerate.cc PModport.cc \
	PNamedItem.cc PPackage.cc PScope.cc \
	PSpec.cc PTimingCheck.cc PTask.cc \
	PUdp.cc PWire.cc Statement.cc \
	AStatement.cc \
	cprop.cc exposenodes.cc nodangle.cc \
	synth.cc synth2.cc syn-rules.cc \
	t-dll.cc t-dll-api.cc t-dll-expr.cc \
	t-dll-proc.cc t-dll-analog.cc \
	../libmisc/LineInfo.cc ../libmisc/StringHeap.cc \
	config.h ../version_tag.h

ivl_LDFLAGS = @rdynamic@
ivl_LDADD = $(dllib) @EXTRALIBS@
if WIN32
ivl_LDFLAGS += -Wl,--out-implib=libivl.a $(srcdir)/ivl.def
endif

BUILT_SOURCES = \
	lexor.cc \
	lexor_keyword.cc \
	parse.cc \
	parse.h \
	syn-rules.cc

CLEANFILES = \
	lexor.cc \
	lexor_keyword.cc \
	parse.cc \
	parse.h \
	syn-rules.cc

EXTRA_DIST = \
	ivl.def \
	lexor.lex \
	lexor_keyword.gperf \
	parse.y \
	syn-rules.y

parse.cc parse.h: $(srcdir)/parse.y
	$(YACC) --verbose -t -p VL --defines=parse.h \
		-o parse.cc $<

syn-rules.cc: $(srcdir)/syn-rules.y
	$(YACC) --verbose -t -p syn_ -o $@ $<

lexor.cc: $(srcdir)/lexor.lex parse.h
	$(LEX) -s -t $< > $@

lexor_keyword.cc: $(srcdir)/lexor_keyword.gperf
	gperf -o -i 7 -C -k 1-4,6,9,$$ \
		-H keyword_hash \
		-N check_identifier \
		-t $< > $@ || (rm -f $@ ; false)

cppcheck:
	cd $(srcdir); \
	cppcheck --enable=all --std=c99 --std=c++11 -f \
		--check-level=exhaustive \
		--suppressions-list=../cppcheck-global.sup \
		--suppressions-list=cppcheck.sup \
		-I $(abs_builddir) -I $(abs_top_builddir) -I .. -I ../libmisc \
		$(ivl_SOURCES)

MAINTAINERCLEANFILES = Makefile.in
