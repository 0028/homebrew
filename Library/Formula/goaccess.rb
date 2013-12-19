require 'formula'

class Goaccess < Formula
  homepage 'http://goaccess.prosoftcorp.com/'
  url 'https://downloads.sourceforge.net/project/goaccess/0.7/goaccess-0.7.tar.gz'
  sha1 '1a887dc7182c91726137aaf6a4627efdd82d988e'

  head 'https://github.com/allinurl/goaccess.git'

  bottle do
    cellar :any
    sha1 '24f34d1f63bc4e653d08b17af64c73554bd34eee' => :mavericks
    sha1 '4e63f2182224bbd96a2a38355c9de90e0b783819' => :mountain_lion
    sha1 'ba7abc5b6e31fc0cff4a237ae53c1ce9bf16a05b' => :lion
  end

  option 'enable-geoip', "Enable IP location information using GeoIP"

  depends_on 'pkg-config' => :build
  depends_on 'glib'
  depends_on 'geoip' if build.include? "enable-geoip"

  def install
    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --prefix=#{prefix}
    ]

    args << "--enable-geoip" if build.include? "enable-geoip"

    system "./configure", *args
    system "make install"
  end
end
