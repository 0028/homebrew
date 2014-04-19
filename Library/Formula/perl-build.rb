require 'formula'

class PerlBuild < Formula
  homepage 'https://github.com/tokuhirom/Perl-Build'
  url 'https://github.com/tokuhirom/Perl-Build/archive/1.06.tar.gz'
  sha1 '59d82893c2b0272137b6d5614a5966df3bdd6a4b'

  head 'https://github.com/tokuhirom/perl-build.git'

  bottle do
    cellar :any
    sha1 "a4f9a1098260a78200f4604425eb3a530a65afcb" => :mavericks
    sha1 "7594ad5c2c882a4955626b00b4a9802132bbe2f9" => :mountain_lion
    sha1 "bfff4778a642eee17c6ce89a5e6a9147f434a232" => :lion
  end

  def install
    bin.install "perl-build", "bin/plenv-install", "bin/plenv-uninstall"
  end
end
