require 'formula'

class Archey < Formula
  homepage 'http://obihann.github.io/archey-osx/'
  url 'https://github.com/obihann/archey-osx/archive/1.4.tar.gz'
  sha1 '545896848444cd77b0c2cad50d5477f824ecf72f'

  bottle do
    cellar :any
    sha1 "5736d6c61d926c2dc7576ffcc43611583dcea69a" => :mavericks
    sha1 "a6c89107076da3fa265bd132668b27c5a00ef41f" => :mountain_lion
    sha1 "f000d159cc8deed402f1b869504b986f66f26f2d" => :lion
  end

  def install
    bin.install 'bin/archey'
  end

  test do
    system "#{bin}/archey"
  end
end
