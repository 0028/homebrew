require 'formula'

class GnuApl < Formula
  homepage 'http://www.gnu.org/software/apl/'
  url 'http://ftpmirror.gnu.org/apl/apl-1.1.tar.gz'
  sha1 'de5071372b64a6d6921141cbbc3555e3b40da7af'

  bottle do
    sha1 '38daefbb549903a05aa985a05f637ff5b893ebe3' => :mavericks
    sha1 'fa9203d107c76c5a7b4b52084fd6f71b637c5d6d' => :mountain_lion
    sha1 'b5118e5d1b62cb6531337fcd7269aff25728517e' => :lion
  end

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
    system "#{bin}/apl", "--version"
  end
end
