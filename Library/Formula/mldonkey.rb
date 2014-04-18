require 'formula'

class Mldonkey < Formula
  homepage 'http://mldonkey.sourceforge.net/Main_Page'
  url 'https://downloads.sourceforge.net/project/mldonkey/mldonkey/3.1.5/mldonkey-3.1.5.tar.bz2'
  sha1 '7bc4f9272ecfe6403eef7062766b26bf321e3015'

  bottle do
    sha1 "482e15b2e530fe70434d25e33a48c89a5644914d" => :mavericks
    sha1 "ffaf19f464ce4bda5453206bdd4985fab148d20a" => :mountain_lion
    sha1 "b64fd4a75408de8a80fd59fe500cdd5f2a023b0d" => :lion
  end

  option "with-x", "Build mldonkey with X11 support"

  depends_on 'pkg-config' => :build
  depends_on 'objective-caml'
  depends_on 'gd'
  depends_on 'libpng'

  if build.with? "x"
    depends_on 'librsvg'
    depends_on 'lablgtk'
  end

  def install
    # Fix compiler selection
    ENV['OCAMLC'] = "#{HOMEBREW_PREFIX}/bin/ocamlc.opt -cc #{ENV.cc}"

    args = ["--prefix=#{prefix}"]
    args << "--enable-gui=newgui2" if build.with? "x"

    system "./configure", *args
    system "make install"
  end
end
