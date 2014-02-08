require 'formula'

class RakudoStar < Formula
  homepage 'http://rakudo.org/'
  url 'http://rakudo.org/downloads/star/rakudo-star-2014.01.tar.gz'
  sha256 '017e28537c88475b2d82621671a7cd8062cb29aa31ec1ecebc67efcb2e1783c8'

  bottle do
    sha1 "6da76032c48807225587b17b3751d6d92ac00c75" => :mavericks
    sha1 "fbea3e8e97d65145ec8473a00cab02890cb71631" => :mountain_lion
    sha1 "1b6c2e76201f2c869562b4e645b06c427da88ddc" => :lion
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
