require 'formula'

class Sipp < Formula
  homepage 'http://sipp.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/sipp/sipp/3.4/sipp-3.3.990.tar.gz'
  sha1 'b2637cb72556595253bbdd4a68cc974c9ac1d92e'

  bottle do
    cellar :any
    sha1 "ccd3e33dcc9ee0e08db3162c6e565ac01e33d470" => :mavericks
    sha1 "570053276176463ea1969c72082307ce7d78666a" => :mountain_lion
    sha1 "18cf2d97c41d993e949e5048cc2c12716053d28c" => :lion
  end

  depends_on 'openssl' => :optional

  def install
    args = ["--with-pcap"]
    args << "--with-openssl" if build.include? 'openssl'
    system "./configure", *args
    system "make", "DESTDIR=#{prefix}"
    bin.install "sipp"
  end
end
