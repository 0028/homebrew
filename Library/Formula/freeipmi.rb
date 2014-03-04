require 'formula'

class Freeipmi < Formula
  homepage 'http://www.gnu.org/software/freeipmi/'
  url 'http://ftpmirror.gnu.org/freeipmi/freeipmi-1.4.1.tar.gz'
  sha1 'd59fd66e6fe9a58437d55a4bdd96ee431a8348e4'

  bottle do
    sha1 "60a47f55640500a8dd59b134e80c71121b5d7e93" => :mavericks
    sha1 "c7a7f84c153c339822968f54e435ccf556899c61" => :mountain_lion
    sha1 "148c4b0c38c5567950f00888182cabe792be0e07" => :lion
  end

  depends_on 'argp-standalone'
  depends_on 'libgcrypt'

  def install
    system './configure', "--prefix=#{prefix}"
    # This is a big hammer to disable building the man pages
    # It breaks under homebrew's build system and I'm not sure why
    inreplace "man/Makefile", "install: install-am", "install:"
    system 'make', 'install'
  end

  test do
    system "#{sbin}/ipmi-fru", "--version"
  end

end
