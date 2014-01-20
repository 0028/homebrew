require 'formula'

class S3Backer < Formula
  homepage 'http://code.google.com/p/s3backer/'
  url 'http://s3backer.googlecode.com/files/s3backer-1.3.7.tar.gz'
  sha1 'c75c7e70cb38bcac41d342a2bdb63e9505ab550a'

  bottle do
    cellar :any
    sha1 "31c4b039e5405128a4973c3cf40ab6cd9fcc7f01" => :mavericks
    sha1 "3597fa98a864dda5e024f04f00f400d9d2ee2cd1" => :mountain_lion
    sha1 "015d81c13de71e8dc7be3ad1ab0dea18fd032ea3" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'osxfuse'

  def install
    inreplace "configure", "-lfuse", "-losxfuse"
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end

  def caveats
    <<-EOS.undent
      Make sure to follow the directions given by `brew info osxfuse`
      before trying to use a FUSE-based filesystem.
    EOS
  end
end
