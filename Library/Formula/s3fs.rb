require 'formula'

class S3fs < Formula
  homepage 'http://code.google.com/p/s3fs/'
  url 'https://github.com/s3fs-fuse/s3fs-fuse/archive/v1.76.tar.gz'
  sha1 '478aa3230b5d85bfe95d9962ee2f1d8cd35fa070'

  bottle do
    cellar :any
    sha1 "1019d02233500ac52089fdee6e0921e77f910c96" => :mavericks
    sha1 "368f58ac644b65336c7273c9c733ec4edf29f7c4" => :mountain_lion
    sha1 "3664703a8ca3e887edd4e63a78dd1f80a94ed631" => :lion
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

  def caveats
    <<-EOS.undent
      Make sure to follow the directions given by `brew info fuse4x-kext`
      before trying to use a FUSE-based filesystem.

      Also, be aware that s3fs has some caveats concerning S3 "directories"
      that have been created by other tools. See the following issue for
      details:

        http://code.google.com/p/s3fs/issues/detail?id=73
    EOS
  end
end
