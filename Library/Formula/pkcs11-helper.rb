require 'formula'

class Pkcs11Helper < Formula
  homepage 'https://github.com/OpenSC/OpenSC/wiki/pkcs11-helper'
  url 'https://github.com/OpenSC/pkcs11-helper/archive/pkcs11-helper-1.11.tar.gz'
  sha1 '45c84c58430ec749e98d05c9e10a66412b7db739'

  head 'https://github.com/OpenSC/pkcs11-helper.git'

  bottle do
    cellar :any
    sha1 '2f4d6e7e593dd906ffa07f05c984b72895417caa' => :mavericks
    sha1 '30cd7984b482a394ae6700387a1fee17443d2649' => :mountain_lion
    sha1 '585249a8865842dcc571d5c6fb88f37278a1d1b4' => :lion
  end

  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build
  depends_on 'pkg-config' => :build

  def install
    system "autoreconf", "--verbose", "--install", "--force"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

end
