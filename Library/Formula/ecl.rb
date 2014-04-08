require 'formula'

class Ecl < Formula
  homepage 'http://ecls.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/ecls/ecls/13.5/ecl-13.5.1.tgz'
  sha1 'db7f732e5e12182118f00c02d8d2531f6d6aefb2'

  bottle do
    sha1 "80b13f450bd94ef0cc81b677ca523458eaac9eeb" => :mavericks
    sha1 "208e468c98a0a6d6e4336ec9cdf07222d5684367" => :mountain_lion
    sha1 "31521609764677a28c584d2c1d0a4dd29e60665d" => :lion
  end

  depends_on 'gmp'

  def install
    ENV.deparallelize
    system "./configure", "--prefix=#{prefix}", "--enable-unicode=yes", "--enable-threads=yes", "--with-system-gmp=yes"
    system "make"
    system "make install"
  end
end
