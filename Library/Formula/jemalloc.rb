require 'formula'

class Jemalloc < Formula
  homepage 'http://www.canonware.com/jemalloc/download.html'
  url 'http://www.canonware.com/download/jemalloc/jemalloc-3.5.0.tar.bz2'
  sha1 '3c6aeed5adbd7267ec7db476f002051143a43ac0'

  bottle do
    sha1 "2faacf503c7a9842602c9a5d54866af9b2f39f68" => :mavericks
    sha1 "0e13f90324aa4e44ebc13e7118b68c1f4bacde84" => :mountain_lion
    sha1 "0703e4d462cb3bfdfbe711e3d7c32df31855fdd5" => :lion
  end

  def install
    system './configure', '--disable-debug', "--prefix=#{prefix}"
    system 'make install'

    # This otherwise conflicts with google-perftools
    mv "#{bin}/pprof", "#{bin}/jemalloc-pprof"
  end
end
