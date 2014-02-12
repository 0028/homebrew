require 'formula'

class S3Backer < Formula
  homepage 'http://code.google.com/p/s3backer/'
  url 'http://s3backer.googlecode.com/files/s3backer-1.3.7.tar.gz'
  sha1 'c75c7e70cb38bcac41d342a2bdb63e9505ab550a'

  bottle do
    cellar :any
    sha1 "47e6b62ac0abebe0441adf8fd00de68b95f71678" => :mavericks
    sha1 "c0c7d74ac0daade301e8db34f9cb7509820a38ad" => :mountain_lion
    sha1 "42648c654ff850bdcbb1e1a8d8db28290dd3f749" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'osxfuse'

  def install
    inreplace "configure", "-lfuse", "-losxfuse"
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
