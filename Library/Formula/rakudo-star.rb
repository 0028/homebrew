require 'formula'

class RakudoStar < Formula
  homepage 'http://rakudo.org/'
  url 'http://rakudo.org/downloads/star/rakudo-star-2013.12.tar.gz'
  sha256 '6a257e5f7879e0a9d7199edcfd47bd5a09dc4d9f5d91f124429af04974a836d3'

  bottle do
    sha1 'e496b65fc89cb0da6f4de00c535bb4804e7364e9' => :mavericks
    sha1 'ea17173f9d73de7595198378387b68858eec8647' => :mountain_lion
    sha1 '690b87483b72e9c60e03bdbd75c5a512992f9076' => :lion
  end

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
    system "perl", "Configure.pl", "--prefix=#{prefix}", "--backends=parrot", "--gen-parrot"
    system "make"
    system "make install"
    # move the man pages out of the top level into share.
    mv "#{prefix}/man", share
  end
end
