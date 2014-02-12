require 'formula'

class S3fs < Formula
  homepage 'http://code.google.com/p/s3fs/'
  url 'https://github.com/s3fs-fuse/s3fs-fuse/archive/v1.76.tar.gz'
  sha1 '478aa3230b5d85bfe95d9962ee2f1d8cd35fa070'

  bottle do
    cellar :any
    sha1 "af3fb1b76982e594b3699a10fa37dd2bf4037aca" => :mavericks
    sha1 "affb93d6de2c157abc2ee73eb97c87647aa4cd18" => :mountain_lion
    sha1 "4ca9229c65fd17ac63792cb61721d0b0ffbbf85d" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on :autoconf
  depends_on :automake
  depends_on 'fuse4x'

  def install
    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end

  def caveats; <<-EOS.undent
    Be aware that s3fs has some caveats concerning S3 "directories"
    that have been created by other tools. See the following issue for
    details:

      http://code.google.com/p/s3fs/issues/detail?id=73
    EOS
  end
end
