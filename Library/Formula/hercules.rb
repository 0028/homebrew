require 'formula'

class Hercules < Formula
  homepage 'http://www.hercules-390.eu/'
  url 'http://downloads.hercules-390.eu/hercules-3.09.tar.gz'
  sha1 '5cbe89ec214de00b90e3077c27db636a7d2607f5'

  bottle do
    sha1 "20d8beb5272ec7459c7ac8f93223770f3d12f1cc" => :mavericks
    sha1 "bc4c39ececf80863692bb667832f3b7782602cd5" => :mountain_lion
    sha1 "a117dcdffd4dfd1bb55bb1f9e87256f1dfae6550" => :lion
  end

  skip_clean :la

  depends_on 'gawk'

  def install
    # For newer compilers, we need to use _FORTIFY_SOURCE=0 to disable
    # buffer overflow protection.
    ENV.append 'CPPFLAGS', "-D_FORTIFY_SOURCE=0" if MacOS.version >= :mavericks

    # Since Homebrew optimizes for us, tell Hercules not to.
    # (It gets it wrong anyway.)
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--enable-optimization=no"
    # Reported upstream:
    # https://github.com/rbowler/spinhawk/issues/16
    inreplace "hscutl.c", "SOL_TCP", "IPPROTO_TCP"
    system "make"
    system "make install"
  end
end
