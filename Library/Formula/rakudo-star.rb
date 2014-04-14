require 'formula'

class RakudoStar < Formula
  homepage 'http://rakudo.org/'
  url 'http://rakudo.org/downloads/star/rakudo-star-2014.03.tar.gz'
  sha256 '6b285fb3fbbfa22f5986a2890cd0ca29de8efb3a60b2d60e948140c24320a994'

  bottle do
    revision 1
    sha1 "30914a34bdf365c562a3a69ed84d5fd19b180ca6" => :mavericks
    sha1 "b3b357c728293d1d6dfc76df5fe693c57cd9c442" => :mountain_lion
    sha1 "2bae5212156c55cb9bd7f65ceca5a783db0f1f05" => :lion
  end

  option 'with-jvm', 'Build also for jvm as an alternate backend.'

  conflicts_with 'parrot'

  depends_on 'gmp' => :optional
  depends_on 'icu4c' => :optional
  depends_on 'pcre' => :optional
  depends_on 'libffi'

  def install
    libffi = Formula["libffi"]
    ENV.remove 'CPPFLAGS', "-I#{libffi.include}"
    ENV.prepend 'CPPFLAGS', "-I#{libffi.lib}/libffi-#{libffi.version}/include"

    ENV.j1  # An intermittent race condition causes random build failures.
    if build.with? "jvm"
      system "perl", "Configure.pl", "--prefix=#{prefix}", "--backends=parrot,jvm", "--gen-parrot"
    else
      system "perl", "Configure.pl", "--prefix=#{prefix}", "--backends=parrot", "--gen-parrot"
    end
    system "make"
    system "make install"
    # move the man pages out of the top level into share.
    mv "#{prefix}/man", share
  end
end
