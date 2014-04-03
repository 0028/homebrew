require 'formula'

class Automake < Formula
  homepage 'http://www.gnu.org/software/automake/'
  url 'http://ftpmirror.gnu.org/automake/automake-1.14.1.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/automake/automake-1.14.1.tar.gz'
  sha1 '0bb1714b78d70cab9907d2013082978a28f48a46'

  bottle do
    revision 1
    sha1 "a762548a744a1f44eff6761da2d1e139ea28f2a1" => :mavericks
    sha1 "8b561b826f9da0113b9ecee9ebdd21e64e3e08bb" => :mountain_lion
    sha1 "baa921ecb4190b5db9b37cba9c6912f79d4bc549" => :lion
  end

  # Always needs a newer autoconf, even on Snow Leopard.
  depends_on 'autoconf' => :run

  keg_only :provided_until_xcode43

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
