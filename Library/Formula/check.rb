require 'formula'

class Check < Formula
  homepage 'http://check.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/check/check/0.9.12/check-0.9.12.tar.gz'
  sha1 'eaa4c1c3273901b63c7bf054d402b554ad8dd9c9'

  bottle do
    cellar :any
    sha1 "6e48860f1a639ea96b7391458629c58dc2cf125b" => :mavericks
    sha1 "fe5b8a41699636a1e12d1f730bb318091e3f9456" => :mountain_lion
    sha1 "9dc1dc744db34e80fc8576de1ff5f895a7196727" => :lion
  end

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
