require 'formula'

class Clamav < Formula
  homepage 'http://www.clamav.net/'
  url 'https://downloads.sourceforge.net/clamav/0.98/clamav-0.98.1.tar.gz'
  sha1 '9f04c0e81463c36f7e58d18f16d1b88f3332dcb8'

  bottle do
    sha1 "2e57397ad5ab1229fada5e4ee488d82d95bb8ada" => :mavericks
    sha1 "78aaaca4e1892fc5a8da68bdbaaa4635082a2cb4" => :mountain_lion
    sha1 "54ea8b999ef0e9e0801beb1ce18bbfe0c6785cf7" => :lion
  end

  skip_clean 'share'

  def install
    (share/'clamav').mkpath

    args = %W{--disable-dependency-tracking
              --prefix=#{prefix}
              --disable-zlib-vcheck
              --libdir=#{lib}
              --sysconfdir=#{etc}}
    args << "--with-zlib=#{MacOS.sdk_path}/usr" unless MacOS::CLT.installed?

    # MacOSX 10.9 (Mavericks) needs specific C++ stdlib to build.
    if ENV.compiler == :clang && MacOS.version >= :mavericks
      ENV.libstdcxx
      ENV.append 'LDFLAGS', '-Wl,-lstdc++'
    end

    system "./configure", *args
    system "make install"
  end
end
