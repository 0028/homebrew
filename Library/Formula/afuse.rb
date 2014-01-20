require 'formula'

class Afuse < Formula
  homepage 'https://github.com/pcarrier/afuse/'
  url 'https://afuse.googlecode.com/files/afuse-0.4.1.tar.gz'
  sha1 '156b196a27c181eee8b192e7922fbe3c32c858e3'

  bottle do
    cellar :any
    sha1 "9d6a69701c110808d4250958418186ca661061d7" => :mavericks
    sha1 "da0bcfad5c506505e62732ed7e002d8299a22ed5" => :mountain_lion
    sha1 "5bfa7edfb029234b122af592e9f3c040a8ca0a08" => :lion
  end

  depends_on :autoconf
  depends_on :automake
  depends_on :libtool

  depends_on 'pkg-config' => :build
  depends_on 'osxfuse'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def caveats; <<-EOS.undent
    Make sure to follow the directions given by `brew info osxfuse`
    before trying to use a FUSE-based filesystem.
    EOS
  end
end
