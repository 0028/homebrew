require 'formula'

class Trash < Formula
  homepage 'http://hasseg.org/trash/'
  url 'http://github.com/ali-rantakari/trash/archive/v0.8.4.zip'
  sha1 '233773bcaed903e296f20635808c3dce7ef93c4b'

  bottle do
    cellar :any
    sha1 "768f072da2ca4ebee3ee1d77db112f062555c51c" => :mavericks
    sha1 "ded40d63d253025b775d97735b92f2eaf9dff748" => :mountain_lion
    sha1 "64396e7894bba72905903ead4f26902124209a93" => :lion
  end

  conflicts_with 'osxutils', :because => 'both install a trash binary'

  def install
    system "make"
    system "make docs"
    bin.install "trash"
    man1.install "trash.1"
  end

  def test
    system "#{bin}/trash"
  end
end
