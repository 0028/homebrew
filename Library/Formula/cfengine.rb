require 'formula'

# https version doesn't download with system curl on Snow Leopard
# https://github.com/Homebrew/homebrew/issues/20339
class Cfengine < Formula
  homepage 'http://cfengine.com/'
  url 'http://cfengine.com/source-code/download?file=cfengine-3.5.3.tar.gz'
  sha1 '95a03e7bc9e31704d6aac4b3023b9c5037fc33f6'

  bottle do
    cellar :any
    sha1 "90600710de4bcba705072544764341427edee5be" => :mavericks
    sha1 "75929da81af76808a2e5cdf06061e913f4b6b0d4" => :mountain_lion
    sha1 "e1876c909ff1abbb31a181161b3d117e6c18bdb2" => :lion
  end

  depends_on 'pcre'
  depends_on 'tokyo-cabinet'
  depends_on 'libxml2' if MacOS.version < :mountain_lion

  def patches
    # Upstream patches for OS X compilation
    %w{
      https://github.com/cfengine/core/commit/d03fcc2d38a4db0c79386aaef30597102bf45853.patch
    }
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-workdir=#{var}/cfengine",
                          "--with-tokyocabinet",
                          "--with-pcre=#{Formula.factory('pcre').opt_prefix}",
                          "--without-mysql",
                          "--without-postgresql"
    system "make install"
  end

  def test
    system "#{bin}/cf-agent", "-V"
  end
end
