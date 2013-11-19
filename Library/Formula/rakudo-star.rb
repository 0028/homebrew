require 'formula'

class RakudoStar < Formula
  homepage 'http://rakudo.org/'
  url 'http://rakudo.org/downloads/star/rakudo-star-2013.10.tar.gz'
  bottle do
    sha1 '7b18490c2d8b5ba9b58f6b9cd901d98416bd6ea8' => :mavericks
    sha1 '13cfa442dca408fe6d67f3ac917af15b85aceff4' => :mountain_lion
    sha1 '1bf5dd5f7d862df7639755d5010769a12790790e' => :lion
  end

  sha256 'cbc6c8b976d19d351eaf1fb0257e971a534c385252ed50b59b41b2459245e4cf'

  conflicts_with 'parrot'

  depends_on 'gmp' => :optional
  depends_on 'icu4c' => :optional
  depends_on 'pcre' => :optional
  depends_on 'libffi'

  def install
    libffi = Formula.factory("libffi")
    ENV.remove 'CPPFLAGS', "-I#{libffi.include}"
    ENV.prepend 'CPPFLAGS', "-I#{libffi.lib}/libffi-#{libffi.version}/include"

    ENV.j1  # An intermittent race condition causes random build failures.
    system "perl", "Configure.pl", "--prefix=#{prefix}", "--gen-parrot"
    system "make"
    system "make install"
    # move the man pages out of the top level into share.
    mv "#{prefix}/man", share
  end
end
