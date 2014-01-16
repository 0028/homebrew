require 'formula'

class Klavaro < Formula
  homepage 'http://klavaro.sourceforge.net/'
  url 'http://sourceforge.net/projects/klavaro/files/klavaro-2.01.tar.bz2'
  sha1 '42967960fb511abe60c536c1ff6794a0c35f38e5'

  bottle do
    sha1 'abf886095ff36d649a440e1238fe4685d5ef4000' => :mavericks
    sha1 '9568063e703a40a15fd248590e379c6a79fc61b6' => :mountain_lion
    sha1 '89053ecc84010488856cddd6a98ea11e14f623f0' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'intltool' => :build
  depends_on 'gtk+'
  depends_on 'gtkdatabox'
  depends_on :x11

  def install
    ENV.append 'LDFLAGS', '-lgmodule-2.0'
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
