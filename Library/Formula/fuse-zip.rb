require 'formula'

class FuseZip < Formula
  homepage 'https://code.google.com/p/fuse-zip/'
  url 'https://fuse-zip.googlecode.com/files/fuse-zip-0.4.0.tar.gz'
  sha1 '09ee8c6f9d045436309e126d891510540c3d68fa'
  bottle do
    cellar :any
    sha1 '0d6d12bbea2f494e8b41b5bb42290cab32a746b0' => :mavericks
    sha1 '12c88c9f87de7b257197335e35c03862b7a063cb' => :mountain_lion
    sha1 '78991564374d137e9d572f1123a37fa083a65d60' => :lion
  end

  head 'https://code.google.com/p/fuse-zip/', :using => :hg

  depends_on 'pkg-config' => :build
  depends_on 'osxfuse'
  depends_on 'libzip'

  def install
    system "make", "INSTALLPREFIX=#{prefix}", "install"
  end

  test do
    system "fuse-zip", "--help"
  end
end
