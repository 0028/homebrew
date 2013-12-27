require 'formula'

class Libslax < Formula
  homepage 'http://www.libslax.org/'
  url 'https://github.com/Juniper/libslax/releases/download/0.17.2/libslax-0.17.2.tar.gz'
  sha1 '20dba3ea27fc6dd6d9e2aa7ad6e931b1dfe8d6bc'

  bottle do
    sha1 'd55efa9a64c35c6adf0d26180c0a7a6f44d3addc' => :mavericks
    sha1 '7edc9ced2fec2d3acf49079160dec1fcd03ae5a8' => :mountain_lion
    sha1 '430b0d51f79a238a497854268eea7773f85f7ed6' => :lion
  end

  head do
    url 'https://github.com/Juniper/libslax.git'

    depends_on 'autoconf' => :build
    depends_on 'automake' => :build
  end

  depends_on 'libtool'  => :build

  if MacOS.version <= :mountain_lion
    depends_on 'libxml2'
    depends_on 'libxslt'
  end

  depends_on 'curl' if MacOS.version <= :lion

  def install
    # If build from read run script to run autoconf
    system "sh ./bin/setup.sh" if build.head?

    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-libedit"
    system "make install"
  end
end
