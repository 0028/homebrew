require 'formula'

class HtmlXmlUtils < Formula
  homepage 'http://www.w3.org/Tools/HTML-XML-utils/'
  url 'http://www.w3.org/Tools/HTML-XML-utils/html-xml-utils-6.7.tar.gz'
  sha1 'f67fc705802ef0b10b9bf84c5b2fa4253b260acd'

  bottle do
    cellar :any
    sha1 "d6970c2b678a534dd0094459cf883eb99e3f3445" => :mavericks
    sha1 "1f91b25ca300aac5b5feb61489d2a1c346c15477" => :mountain_lion
    sha1 "aaedcd7439f00745e6b813e12f7af020dc6289c7" => :lion
  end

  def install
    ENV.append 'CFLAGS', '-std=gnu89'
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make"
    ENV.j1 # install is not thread-safe
    system "make install"
  end
end
