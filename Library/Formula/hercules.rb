require 'formula'

class Hercules < Formula
  homepage 'http://www.hercules-390.eu/'
  url 'http://downloads.hercules-390.eu/hercules-3.09.tar.gz'
  sha1 '5cbe89ec214de00b90e3077c27db636a7d2607f5'

  bottle do
    sha1 '2557751e6da5a5df6a8f3554b0b82da59a64534a' => :mavericks
    sha1 'af1f427fe88937b79674f95aae34f7074b1e2b41' => :mountain_lion
    sha1 '09a26b3f34fae65790c361d007fceaa55ff4883a' => :lion
  end

  skip_clean :la

  depends_on 'gawk'

  def install
    # Since Homebrew optimizes for us, tell Hercules not to.
    # (It gets it wrong anyway.)
     ENV.append 'CPPFLAGS', "-D_FORTIFY_SOURCE=0"
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
