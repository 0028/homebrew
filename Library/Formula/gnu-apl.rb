require 'formula'

class GnuApl < Formula
  homepage 'http://www.gnu.org/software/apl/'
  url 'http://ftpmirror.gnu.org/apl/apl-1.2.tar.gz'
  bottle do
    sha1 '94e2cd8cacfcb5940166d812e11b70bc7e3c2532' => :mavericks
    sha1 '2d63e0bfc5fbcbe1c374f08d45e0f436f52d1534' => :mountain_lion
    sha1 '1578a37f68551a0ad4fc6829ee74b868bbbb2610' => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/apl/apl-1.2.tar.gz'
  sha1 'ea037a7edc4da90bd8eecfe7d1d9f904e993e64f'

  # GNU Readline is required; libedit won't work.
  depends_on 'readline'

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    ENV["TERM"] = "dumb"
    system "#{bin}/apl", "--version"
  end
end
