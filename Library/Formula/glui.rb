require 'formula'

class Glui < Formula
  homepage 'http://glui.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/glui/Source/2.36/glui-2.36.tgz'
  sha256 'c1ef5e83cf338e225ce849f948170cd681c99661a5c2158b4074515926702787'

  bottle do
    cellar :any
    sha1 "4a5c5336a8e5a7396bccfb5613d5a7bd9b2d9e33" => :mavericks
    sha1 "2721583daa14eb6f48fc717492dbf1229744d048" => :mountain_lion
    sha1 "d40bd8019ee00e2ed6a131b1b48753dc2cd377a9" => :lion
  end

  # Fix compiler warnings in glui.h. Reported upstream:
  # http://sourceforge.net/p/glui/patches/12/
  def patches; DATA; end

  def install
    cd 'src' do
      system 'make setup'
      system 'make lib/libglui.a'
      lib.install 'lib/libglui.a'
      include.install 'include/GL'
    end
  end

  def caveats; <<-EOS.undent
        Use #include <GL/glui.h> and pass the compiler -lglui
      EOS
  end

end

__END__
diff --git a/src/include/GL/glui.h b/src/include/GL/glui.h
index 01a5c75..5784e29 100644
--- a/src/include/GL/glui.h
+++ b/src/include/GL/glui.h
@@ -941,7 +941,7 @@ public:
         spacebar_mouse_click = true;    /* Does spacebar simulate a mouse click? */
         live_type      = GLUI_LIVE_NONE;
         text = "";
-        last_live_text == "";
+        last_live_text = "";
         live_inited    = false;
         collapsible    = false;
         is_open        = true;
