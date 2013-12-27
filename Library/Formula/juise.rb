require 'formula'

class Juise < Formula
  homepage 'https://github.com/Juniper/juise/wiki'
  url 'https://github.com/Juniper/juise/releases/download/0.5.9/juise-0.5.9.tar.gz'
  sha1 '0d1663164904fee8ebbf29025fb2819e0ad34404'

  bottle do
    sha1 '76c3eae54c4ebac94104303be400b3f976cc4163' => :mavericks
    sha1 'a6666a8c24000493cebb0dbdd9be8c0db7183c28' => :mountain_lion
    sha1 '47f08b5fa0a1fc4de987b3b4f716b8d42ec2291b' => :lion
  end

  head do
    url 'https://github.com/Juniper/juise.git'

    depends_on 'autoconf' => :build
    depends_on 'automake' => :build
  end

  depends_on 'libtool'  => :build
  depends_on 'libslax'
  depends_on 'libssh2'
  depends_on 'pcre'
  depends_on 'sqlite'

  def install
    system "sh ./bin/setup.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-libssh2-prefix=#{HOMEBREW_PREFIX}",
                          "--with-sqlite3-prefix=#{Formula.factory('sqlite').opt_prefix}",
                          "--enable-libedit"
    system "make install"
  end
end
