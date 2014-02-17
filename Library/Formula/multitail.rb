require 'formula'

class Multitail < Formula
  homepage 'http://www.vanheusden.com/multitail/download.html'
  url 'http://www.vanheusden.com/multitail/multitail-6.2.1.tgz'
  sha1 '30bd77c4f542cd6ad6f1a0351f7d9e0a6cef6585'

  bottle do
    sha1 "29e02c45afe35da4ca80968514dd491de62c361d" => :mavericks
    sha1 "387e36935e8c2934f7efd4e0710936f36588fe06" => :mountain_lion
    sha1 "8b22f2eadf94e0145e01229542a1fa2981936403" => :lion
  end

  def install
    ENV['DESTDIR'] = prefix
    system "make", "-f", "makefile.macosx", "multitail"

    bin.install "multitail"
    man1.install gzip("multitail.1")
    etc.install "multitail.conf"
  end
end
