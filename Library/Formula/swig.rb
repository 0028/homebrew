require 'formula'

class Swig < Formula
  homepage 'http://www.swig.org/'
  url 'https://downloads.sourceforge.net/project/swig/swig/swig-3.0.0/swig-3.0.0.tar.gz'
  sha1 '10a1cc5ba6abbc7282b8146ccc0d8eefe233bfab'

  bottle do
    sha1 "228c9842398b6e41cd14676475535ceb32bb2e1a" => :mavericks
    sha1 "088abd08fd9b9098240d291cae3640d6e6f7c4cc" => :mountain_lion
    sha1 "02957961032a8e093548598615f142cb50ed852b" => :lion
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
