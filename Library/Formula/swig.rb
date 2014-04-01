require 'formula'

class Swig < Formula
  homepage 'http://www.swig.org/'
  url 'https://downloads.sourceforge.net/project/swig/swig/swig-3.0.0/swig-3.0.0.tar.gz'
  sha1 '10a1cc5ba6abbc7282b8146ccc0d8eefe233bfab'

  bottle do
    revision 1
    sha1 "20abdfd0f8f48d44c2c46cd79c515f92ee26eba9" => :mavericks
    sha1 "c808acf3b3d32a0886cb4208f42a4463c2b3ecd8" => :mountain_lion
    sha1 "933ea9e2d2f442927ef5685ce3049803bbf74520" => :lion
  end

  option :universal

  depends_on 'pcre'

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
