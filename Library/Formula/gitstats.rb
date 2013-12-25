require 'formula'

class Gitstats < Formula
  homepage 'http://gitstats.sourceforge.net/'
  url 'https://github.com/hoxu/gitstats/archive/a266ddc1ccd281739a916e064756d1f9ac0f1f52.zip'
  sha1 '583e918d2ff4bf34ca498254d8049ff43b6ac536'

  bottle do
    cellar :any
    sha1 'da6459c49623dcef6a9c36dfae899d9bdb32a97e' => :mavericks
    sha1 '788de14940bcbf1065c2471fd77406028a6c9c84' => :mountain_lion
    sha1 'ac8535875ec4a535163465e58942e95ee0ca9726' => :lion
  end

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/gitstats"
  end
end
