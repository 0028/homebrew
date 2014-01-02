require 'formula'

class Autoconf < Formula
  homepage 'http://www.gnu.org/software/autoconf'
  url 'http://ftpmirror.gnu.org/autoconf/autoconf-2.69.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz'
  sha1 '562471cbcb0dd0fa42a76665acf0dbb68479b78a'

  bottle do
    revision 1
    sha1 'f9cb45ea21bd74bfe4e4f800c3e7d54d6bf9dfca' => :mavericks
    sha1 '340c39b905b981b4a3e48b237d19a805fb1bfd88' => :mountain_lion
    sha1 '73ba86d4d129488e6cb1550ad27b3f9891d09fdb' => :lion
  end

  if MacOS::Xcode.provides_autotools? or File.file? "/usr/bin/autoconf"
    keg_only "Xcode (up to and including 4.2) provides (a rather old) Autoconf."
  end

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
