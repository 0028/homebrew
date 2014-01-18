require 'formula'

class Primesieve < Formula
  homepage 'http://primesieve.org/'
  url 'http://dl.bintray.com/kimwalisch/primesieve/primesieve-5.0.tar.gz'
  sha1 '2ffdf45dfd243f456cf6f07f9660fc92eebf9603'

  bottle do
    cellar :any
    sha1 '321eee80820b3d471b4e7bdd3c52f7ca98f75731' => :mavericks
    sha1 'a703c79f50a14bdc91add4057113a66cee68c554' => :mountain_lion
    sha1 '51f9c2bbedb3a5494888002e0a8cb62adba099cb' => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}", "CXX=#{ENV.cxx}",
                          "CXXFLAGS=#{ENV.cflags}"
    system 'make install'
  end

  def test
    system "#{bin}/primesieve", '2', '1000', '--count=1', '-p2'
  end
end
