require 'formula'

class Daq < Formula
  homepage 'http://www.snort.org/'
  url 'http://www.snort.org/dl/snort-current/daq-2.0.1.tar.gz'
  sha1 '63431274e868195a8c4efb064b204aa5a151d387'

  bottle do
    cellar :any
    sha1 'cc052407e57216a7dd82febaaa8bef9c7ccc4469' => :mavericks
    sha1 'e543ab5cdd25c7a6ad64dcfb129bcb647d9cf24f' => :mountain_lion
    sha1 'eec5f2e1c471459075c9b48d9305a19349ec5936' => :lion
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
