require 'formula'

class Ncdc < Formula
  homepage 'http://dev.yorhel.nl/ncdc'
  url 'http://dev.yorhel.nl/download/ncdc-1.19.tar.gz'
  sha1 '7f478b7daf09202586b40899cc6beabeb0d23178'

  bottle do
    cellar :any
    sha1 "a0fe53da7896f6de5ead46286a06588fb861971b" => :mavericks
    sha1 "3089cba872f438a48c7334009a11d76f33b39b3c" => :mountain_lion
    sha1 "d4b6905cae2758e972b384e5157de943475e7d77" => :lion
  end

  option 'with-geoip', "Build with geoip support"

  depends_on 'glib'
  depends_on 'sqlite'
  depends_on 'gnutls' => 'with-p11-kit'
  depends_on 'pkg-config' => :build
  depends_on 'geoip' => :optional



  def install
    args = [
      "--disable-dependency-tracking",
      "--prefix=#{prefix}"]
    args << '--with-geoip' if build.with? 'geoip'

    system "./configure", *args
    system "make install"
  end

  test do
    system "#{bin}/ncdc", "-v"
  end
end
