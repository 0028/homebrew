require 'formula'

class Automake < Formula
  homepage 'http://www.gnu.org/software/automake/'
  url 'http://ftpmirror.gnu.org/automake/automake-1.14.1.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/automake/automake-1.14.1.tar.gz'
  sha1 '0bb1714b78d70cab9907d2013082978a28f48a46'

  bottle do
    revision 1
    sha1 "23ba82afe3c80b1ce00fe2be5bafecf038be0b37" => :mavericks
    sha1 "d5e1bd7d9b5feb9a446520ab85082fce0cd9a15f" => :mountain_lion
    sha1 "0549dd20dc3f8a2551a19961e3a0d697467c20dd" => :lion
  end

  # Always needs a newer autoconf, even on Snow Leopard.
  depends_on 'autoconf' => :run

  if MacOS::Xcode.provides_autotools? or File.file? "/usr/bin/automake"
    keg_only "Xcode (up to and including 4.2) provides (a rather old) Automake."
  end

  def install
    ENV['PERL'] = '/usr/bin/perl'

    system "./configure", "--prefix=#{prefix}"
    system "make install"

    # Our aclocal must go first. See:
    # https://github.com/Homebrew/homebrew/issues/10618
    (share/"aclocal/dirlist").write <<-EOS.undent
      #{HOMEBREW_PREFIX}/share/aclocal
      /usr/share/aclocal
    EOS
  end

  test do
    system "#{bin}/automake", "--version"
  end
end
