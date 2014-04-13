require "formula"

class Libdisasm < Formula
  homepage "http://bastard.sourceforge.net"
  url "https://downloads.sourceforge.net/project/bastard/libdisasm/0.23/libdisasm-0.23.tar.gz"
  sha1 "ff5e2ffb726d1c28396b21e0abbe10bae5d4a846"

  bottle do
    cellar :any
    sha1 "cd13cf997cbce91563ba03d4f16da2032f582e91" => :mavericks
    sha1 "0d4edc27ed0ad94a6a6df9dc6779b99336404423" => :mountain_lion
    sha1 "859e603dfbac6774e56f2d16ad34d160fb69435c" => :lion
  end

  depends_on :python => :optional
  depends_on 'swig' if build.with? 'python'

  def patches
    # Fix the Python binding's Makefile to use the correct paths
    DATA
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"

    if build.with? 'python'
      cd "libdisasm/swig/python" do
        system "make", "-f", "Makefile-swig", "PREFIX=#{prefix}", "install"
      end
    end
  end
end

__END__
--- a/libdisasm/swig/python/Makefile-swig
+++ b/libdisasm/swig/python/Makefile-swig
@@ -14,9 +14,7 @@
 CC_FLAGS	=	-c -fPIC
 endif
 
-ifndef LD_FLAGS
-LD_FLAGS	=	-shared -L.. -ldisasm
-endif
+LD_FLAGS := -shared -L$(PREFIX)/lib -ldisasm $(shell python-config --libs)
 
 INTERFACE_FILE	=	libdisasm_oop.i
 
@@ -27,9 +25,9 @@
 PYTHON_SHADOW	=	$(BASE_NAME)_wrap.c
 PYTHON_SWIG	=	$(BASE_NAME).py
 PYTHON_OBJ	=	$(BASE_NAME)_wrap.o
-PYTHON_INC	=	`/bin/echo -e 'import sys\nprint sys.prefix + "/include/python" + sys.version[:3]' | python`
-PYTHON_LIB	=	`/bin/echo -e 'import sys\nprint sys.prefix + "/lib/python" + sys.version[:3]' | python`
-PYTHON_DEST	=	$(PYTHON_LIB)/lib-dynload/_$(BASE_NAME).so
+PYTHON_INC := $(shell python-config --include)
+PYTHON_LIB	=	$(PREFIX)/lib/python2.7/site-packages
+PYTHON_DEST	=	$(PYTHON_LIB)/_$(BASE_NAME).so
 
 #====================================================
 # TARGETS
@@ -51,8 +49,8 @@
 
 # ==================================================================
 install: $(PYTHON_MOD)
-	sudo cp $(PYTHON_MOD) $(PYTHON_DEST)
-	sudo cp $(PYTHON_SWIG) $(PYTHON_LIB)
+	mkdir -p $(PYTHON_LIB) && install $(PYTHON_MOD) $(PYTHON_DEST)
+	install $(PYTHON_SWIG) $(PYTHON_LIB)
 
 # ==================================================================
 uninstall:
