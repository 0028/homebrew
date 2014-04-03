require 'formula'

class Autoconf < Formula
  homepage 'http://www.gnu.org/software/autoconf'
  url 'http://ftpmirror.gnu.org/autoconf/autoconf-2.69.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz'
  sha1 '562471cbcb0dd0fa42a76665acf0dbb68479b78a'

  bottle do
    revision 2
    sha1 "23c2c2d0dbc6edc49fb31dfe2d167c6a9548f962" => :mavericks
    sha1 "ea08219b1754b3e7c665f1fcee313ea0b2951770" => :mountain_lion
    sha1 "c4f0e5b54c6773948928bb104f0464d676556698" => :lion
  end

  keg_only :provided_until_xcode43

  def install
    ENV['PERL'] = '/usr/bin/perl'

    # force autoreconf to look for and use our glibtoolize
    inreplace 'bin/autoreconf.in', 'libtoolize', 'glibtoolize'
    # also touch the man page so that it isn't rebuilt
    inreplace 'man/autoreconf.1', 'libtoolize', 'glibtoolize'
    system "./configure", "--prefix=#{prefix}"
    system "make install"
    rm_f info/'standards.info'
  end

  test do
    cp "#{share}/autoconf/autotest/autotest.m4", 'autotest.m4'
    system "#{bin}/autoconf", 'autotest.m4'
  end
end
