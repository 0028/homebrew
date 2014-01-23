require 'formula'

class Clamav < Formula
  homepage 'http://www.clamav.net/'
  url 'http://downloads.sourceforge.net/clamav/0.98/clamav-0.98.1.tar.gz'
  sha1 '9f04c0e81463c36f7e58d18f16d1b88f3332dcb8'

  bottle do
    sha1 "189f67170955b296df0f3edef422915da1e6e959" => :mavericks
    sha1 "9f4194c122af53cef18945ec5d630656132cc9b3" => :mountain_lion
    sha1 "bdd9800082691a32b614f7b3e7559c8fe3d6ecfd" => :lion
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

    system "./configure", *args
    system "make install"
  end
end
