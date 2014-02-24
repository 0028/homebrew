require 'formula'

class Xlslib < Formula
  homepage 'http://sourceforge.net/projects/xlslib'
  url 'http://downloads.sourceforge.net/project/xlslib/xlslib-package-2.4.0.zip'
  sha1 '73447c5c632c0e92c1852bd2a2cada7dd25f5492'

  bottle do
    cellar :any
    sha1 "95b5db117b71d13266f367a562bbdfdc4af04fbc" => :mavericks
    sha1 "359541ccca7458af0bea62e1395bb6e9217a4d29" => :mountain_lion
    sha1 "b9758b583a453964674d8d8e0848f616c4fc7ca1" => :lion
  end

  def install
    cd 'xlslib'
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
