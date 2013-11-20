require 'formula'

class Apib < Formula
  homepage 'https://github.com/apigee/apib'
  url 'https://github.com/apigee/apib/archive/APIB_1_0.zip'
  sha1 '25d5b29bfab858e71ca166d29e9218bd39ba5cc6'

  bottle do
    cellar :any
    sha1 'd6650808cda17885ef909e0a3d6aad638e2e5108' => :mavericks
    sha1 'e7e024bd3d9229e1e14196004b54eebd01e76b1c' => :mountain_lion
    sha1 'd028684fab16964c54cd4ee2c600073cc9222337' => :lion
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    bin.install('apib')
    bin.install('apibmon')
  end

  test do
    system "#{bin}/apib", "-c 1", "-d 1", "http://www.google.com"
  end
end
