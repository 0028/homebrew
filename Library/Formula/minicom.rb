require 'formula'

class Minicom < Formula
  homepage 'http://alioth.debian.org/projects/minicom/'
  url 'http://ftp.de.debian.org/debian/pool/main/m/minicom/minicom_2.6.2.orig.tar.gz'
  sha1 'e4267f89e4046c4e3d28cad5aa643edb1de4169a'

  bottle do
    sha1 'b2359564a6b5a55a522e6c7b2ba9623a0079acba' => :mavericks
    sha1 '0f6a358d7fc4f89ecc506da9d5360a3da763b81d' => :mountain_lion
    sha1 '2f3a1950514da18c72051673d6eba008bcc663f4' => :lion
  end

  def install
    # There is a silly bug in the Makefile where it forgets to link to iconv. Workaround below.
    ENV['LIBS'] = '-liconv'

    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make install"

    (prefix + 'etc').mkdir
    (prefix + 'var').mkdir
    (prefix + 'etc/minirc.dfl').write "pu lock #{prefix}/var\npu escape-key Escape (Meta)\n"
  end

  def caveats; <<-EOS
Terminal Compatibility
======================
If minicom doesn't see the LANG variable, it will try to fallback to
make the layout more compatible, but uglier. Certain unsupported
encodings will completely render the UI useless, so if the UI looks
strange, try setting the following environment variable:

LANG="en_US.UTF-8"

Text Input Not Working
======================
Most development boards require Serial port setup -> Hardware Flow
Control to be set to "No" to input text.
    EOS
  end
end
