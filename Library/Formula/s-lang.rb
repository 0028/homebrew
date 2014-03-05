require 'formula'

class SLang < Formula
  homepage 'http://www.jedsoft.org/slang/'
  url 'ftp://space.mit.edu/pub/davis/slang/v2.2/slang-2.2.4.tar.bz2'
  bottle do
    sha1 "f665dcdb47e4fa938e60e85c427036f3bc6d1264" => :mavericks
    sha1 "a9359a6858a222ac8836fdd6b503a90f0b6d70c0" => :mountain_lion
    sha1 "42585b420f99014750ae42e1cc818c2bfb63bcd4" => :lion
  end

  mirror 'http://pkgs.fedoraproject.org/repo/pkgs/slang/slang-2.2.4.tar.bz2/7fcfd447e378f07dd0c0bae671fe6487/slang-2.2.4.tar.bz2'
  sha1 '34e68a993888d0ae2ebc7bc31b40bc894813a7e2'

  depends_on :libpng
  depends_on 'pcre' => :optional
  depends_on 'oniguruma' => :optional

  def install
    png = Formula["libpng"]
    system "./configure", "--prefix=#{prefix}",
                          "--with-pnglib=#{png.lib}",
                          "--with-pnginc=#{png.include}"
    ENV.j1
    system "make"
    system "make install"
  end
end
