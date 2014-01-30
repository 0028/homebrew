require 'formula'

class Expat < Formula
  homepage 'http://expat.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/expat/expat/2.1.0/expat-2.1.0.tar.gz'
  sha1 'b08197d146930a5543a7b99e871cba3da614f6f0'

  bottle do
    cellar :any
    sha1 "37f1bb244d17bb83b612f60b626fcd8540c66785" => :mavericks
    sha1 "7991be0f51a50ad3fe076992df5a26a069e44db8" => :mountain_lion
    sha1 "ea4b9122b163a0b72517f19f4c594fe9b4b4fc5b" => :lion
  end

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make install"
  end

  def caveats
    "Note that OS X has Expat 1.5 installed in /usr already."
  end
end
