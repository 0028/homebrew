require 'formula'

# Version is "pre-release", but is what Debian, MacPorts, etc.
# package, and upstream has not had any movement in a long time.
class Iftop < Formula
  homepage 'http://www.ex-parrot.com/~pdw/iftop/'
  url 'http://www.ex-parrot.com/pdw/iftop/download/iftop-1.0pre4.tar.gz'
  version '1.0pre4'
  sha1 '7f8e16ea26a0dee37ec9d1cbcef7b27692036572'

  bottle do
    cellar :any
    sha1 "aa3a7b7303bce732cf2506eeac69a874565ff07b" => :mavericks
    sha1 "e9c9f8612d473d980210dd899eaca638632d55d0" => :mountain_lion
    sha1 "9e521fff0d7789b59b84d7e024a3dec6f1776dde" => :lion
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make install"
  end

  def caveats; <<-EOS.undent
    iftop requires superuser privileges. You can either run the program
    via `sudo`, or change its ownership to root and set the setuid bit:
    $ sudo chown root:wheel #{sbin}/iftop
    $ sudo chmod u+s #{sbin}/iftop

    In any case, you should be certain that you trust the software you
    are executing with elevated privileges.
    EOS
  end

end
