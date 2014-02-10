require 'formula'

class Yacas < Formula
  homepage 'http://yacas.sourceforge.net'
  url 'http://yacas.sourceforge.net/backups/yacas-1.3.4.tar.gz'
  sha1 'b0918e7f1e697fde48f09055528dacbf7513b931'

  bottle do
    sha1 "ed2eedf10409b27495e9ce53b9073b63b9d3897e" => :mavericks
    sha1 "2e41b5764602015edb4c17399c310cedf946bba1" => :mountain_lion
    sha1 "0df8445aa13fdf88053371c0b12491b2badb4a6c" => :lion
  end

  option "with-server", "Build the network server version"

  def install
    args = [ "--disable-silent-rules",
             "--disable-dependency-tracking",
             "--prefix=#{prefix}"
    ]

    args << "--enable-server" if build.with? "server"

    system "./configure", *args
    system "make", "install"
    system "make", "test"
  end
end
