require 'formula'

class Mess < Formula
  homepage 'http://www.mess.org/'
  url 'svn://dspnet.fr/mame/trunk', :revision => '29406'
  version '0.153'

  head 'svn://dspnet.fr/mame/trunk'

  bottle do
    cellar :any
    sha1 "1036758f5b13b7d600e8acaf6570fce60dcb5f44" => :mavericks
    sha1 "060d0b673484d6eefb24ec02435a5c9d6bbf6ae3" => :mountain_lion
    sha1 "ccad517a5b31e2108e93af80f0c2c32d2ead843c" => :lion
  end

  depends_on 'sdl'

  # Fixes finding OpenGL headers, already patched upstream
  # See: http://git.redump.net/mame/commit/?id=e5e4c0de7169d5cce7167e28a66a75f98d2484c4
  patch :DATA unless build.head?

  def install
    ENV['MACOSX_USE_LIBSDL'] = '1'
    ENV['PTR64'] = (MacOS.prefer_64_bit? ? '1' : '0')

    system "make", "CC=#{ENV.cc}", "LD=#{ENV.cxx}",
                   "TARGET=mess", "SUBTARGET=mess"

    if MacOS.prefer_64_bit?
      bin.install 'mess64' => 'mess'
    else
      bin.install 'mess'
    end
  end
end

__END__
diff --git a/src/osd/sdl/osd_opengl.h b/src/osd/sdl/osd_opengl.h
index c7709f7..73ef207 100644
--- a/src/osd/sdl/osd_opengl.h
+++ b/src/osd/sdl/osd_opengl.h
@@ -45,8 +45,8 @@
 	#define APIENTRY
 	#endif
 
-	#include "GL/gl.h"
-	#include "GL/glext.h"
+	#include <OpenGL/gl.h>
+	#include <OpenGL/glext.h>
 
 	typedef void (APIENTRY * PFNGLACTIVETEXTUREARBPROC) (GLenum target);
 #endif
diff --git a/src/osd/sdl/sdl.mak b/src/osd/sdl/sdl.mak
index 819f465..9d92061 100644
--- a/src/osd/sdl/sdl.mak
+++ b/src/osd/sdl/sdl.mak
@@ -478,7 +478,7 @@ else
 INCPATH += `sdl-config --cflags | sed 's:/SDL::'`
 CCOMFLAGS += -DNO_SDL_GLEXT
 # Remove libSDLmain, as its symbols conflict with SDLMain_tmpl.m
-LIBS += `sdl-config --libs | sed 's/-lSDLmain//'` -lpthread
+LIBS += `sdl-config --libs | sed 's/-lSDLmain//'` -lpthread -framework OpenGL
 DEFS += -DMACOSX_USE_LIBSDL
 endif   # MACOSX_USE_LIBSDL
 
--
cgit v0.9.2-21-gd62e
