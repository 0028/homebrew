require 'formula'

class AutopanoSiftC < Formula
  homepage 'http://wiki.panotools.org/Autopano-sift-C'
  url 'https://downloads.sourceforge.net/project/hugin/autopano-sift-C/autopano-sift-C-2.5.1/autopano-sift-C-2.5.1.tar.gz'
  sha1 'f8c5f4004ae51cb58acc5cedb065ae0ef3e19a8c'

  bottle do
    cellar :any
    sha1 "007e12df5990c91bcf257fb51fc10139b9f41bdf" => :mavericks
    sha1 "dda2cf704b913890851a8ed2b8069a054fa47d85" => :mountain_lion
    sha1 "a0c5deae5ae87820b846ee022e5c51b3720a5b11" => :lion
  end

  depends_on 'libpano'
  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end

  test do
    assert_match /Version #{Regexp.escape(version)}/, pipe("#{bin}/autopano-sift-c")
  end
end
