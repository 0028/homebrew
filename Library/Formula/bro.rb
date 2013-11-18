require 'formula'

class Bro < Formula
  homepage 'http://www.bro-ids.org/'
  url 'http://www.bro-ids.org/downloads/release/bro-2.2.tar.gz'
  sha1 'cd70c426ca0369f16919cf45ad3222e6287908df'

  bottle do
    sha1 'c9385679a49ffb1927536c8a8140c89aaa3bdbaf' => :mavericks
    sha1 '4596089bbcab0cc306e38d96371563b99a273219' => :mountain_lion
    sha1 'b57b91dd3b592d8c617ed138fc969409ad99a105' => :lion
  end

  depends_on 'cmake' => :build
  depends_on 'swig' => :build
  depends_on 'libmagic'
  depends_on 'geoip' => :recommended

  def install
    # Ruby bindings not building for me on 10.6 - @adamv
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
