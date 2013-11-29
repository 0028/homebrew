require 'formula'

class Abcmidi < Formula
  homepage 'http://www.ifdo.ca/~seymour/runabc/top.html'
  url 'http://www.ifdo.ca/~seymour/runabc/abcMIDI-2013-11-26.zip'
  version '2013-09-15'
  sha1 '3e743b2a89404ad5a7d7f51c48cc2a32ba50654b'

  bottle do
    cellar :any
    sha1 'b6a7115b86a85bca57f1849804aef3886f162f7b' => :mavericks
    sha1 '43003c7b5dec60ee91e875bc95e7e1a556ad5bab' => :mountain_lion
    sha1 '0e7719cba484e3e9008a028e2a416b329cef828d' => :lion
  end

  def install
    # configure creates a "Makefile" file. A "makefile" file already exist in
    # the tarball. On case-sensitive file-systems, the "makefile" file won't
    # be overridden and will be chosen over the "Makefile" file.
    system "rm", "makefile"

    system "./configure", "--disable-debug", "--prefix=#{prefix}", "--mandir=#{man}"
    # The Makefile is broken when using --prefix (value is added to path twice).
    # abcmidi author is notified (2012-06-20). In the meantime, here's a fix.
    inreplace "Makefile", "$(DESTDIR)${prefix}", "$(DESTDIR)"

    system "make", "install"
  end

  def test
    system "#{bin}/abc2midi"
  end
end
