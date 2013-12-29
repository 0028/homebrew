require 'formula'

class Innoextract < Formula
  homepage 'http://constexpr.org/innoextract/'
  url 'https://github.com/dscharrer/innoextract/archive/1.4.tar.gz'
  sha1 '63f5c52eb1e558e7f5f4221769fd6991812f6ef8'
  head 'https://github.com/dscharrer/innoextract.git'

  bottle do
    cellar :any
    sha1 '5fe8b74218ed985e5f3ae5e46a5e06cd086770c4' => :mavericks
    sha1 'e926249de214f676f77da0ea6ab26f0554e8b51f' => :mountain_lion
    sha1 '3f277b8595062bf6813d777c2e9c973997a2f0a7' => :lion
  end

  depends_on 'cmake' => :build
  depends_on 'boost'
  depends_on 'xz'

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "#{bin}/innoextract", "--version"
  end
end
