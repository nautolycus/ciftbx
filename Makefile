#
#  Makefile for ciftbx, cyclops, cif2cif, cif2xml web related files
#  H. J. Bernstein, Bernstein+Sons, 17 July 2000
#  The valid make calls are:
#
#     make README.html      rebuilds README.html from README.html.m4
#     make MANIFEST.html    rebuilds MANIFEST.html from MANIFEST.html.m4
#     make expanded         creates local expanded files
#
#===============  The following definitions may need to be modified for
#===============  your system
#

#  The locations of any programs used
#  The most common alternative are given immediately below
M4	=	m4
MKDECOMPLN	=	./mkdecompln
RMDECOMPLN	=	./rmdecompln
EXPAND		=	/var/tmp
#
#  The definition of VPATH must be the httpd virtual path to
#  the directory holding this version of the directory, i.e.
#  containing the ciftbx_n.n.n directory  MANIFEST.html 
#  and README.html must be rebuilt if VPATH changes.
VPATH		=	NDB/mmcif/software
#VPATH		=	~yaya/software
#VPATH		=	pb/pdb2cif
#
#  The definition of DECOMP must be the httpd virtual path to
#  the cgi-bin script decomp.cgi.  If this script is not available
#  define DECOMP as NODECOMP
DECOMP		=	/cgi-bin/yaya/decomp.cgi
#DECOMP		=	/~yaya/cgi-bin/decomp.cgi
#DECOMP		=	/pb/pdb2cif/cgi-bin/decomp.cgi
#DECOMP	=	NODECOMP
#
#
#
ZPATH		=	$(DECOMP)/$(VPATH)
#
MANIFEST.html:	MANIFEST.html.m4 Makefile
		-@rm MANIFEST.html.BAK
		-@mv MANIFEST.html MANIFEST.html.BAK
		m4 -DZPATH=$(ZPATH) -DDECOMP=$(DECOMP) < MANIFEST.html.m4 \
		> MANIFEST.html

README.html:	README.html.m4 Makefile
		-@rm README.html.BAK
		-@mv README.html README.html.BAK
		m4 -DGRAPHICS=1 \
		-DZPATH=$(ZPATH) -DDECOMP=$(DECOMP) < README.html.m4 \
		> README.html

expanded:	cif2cif.cshar.Z cif2cif.shar.Z \
		cif_core.dic.Z cif_mm.dic.Z \
		ciftbx.cshar.Z ciftbx.shar.Z \
		cyclops.cshar.Z cyclops.shar.Z \
		cif2xml.cshar.Z cif2xml.shar.Z
		$(MKDECOMPLN) cif2cif.cshar .
		$(MKDECOMPLN) cif2cif.shar .
		$(MKDECOMPLN) cif_core.dic .
		$(MKDECOMPLN) cif_mm.dic .
		$(MKDECOMPLN) ciftbx.cshar .
		$(MKDECOMPLN) ciftbx.shar .
		$(MKDECOMPLN) cyclops.cshar .
		$(MKDECOMPLN) cyclops.shar .
		$(MKDECOMPLN) cif2xml.cshar .
		$(MKDECOMPLN) cif2xml.shar .
