require 'formula'

class Stone < Formula
  homepage 'http://www.gcd.org/sengoku/stone/'
  url 'http://www.gcd.org/sengoku/stone/stone-2.3e.tar.gz'
  sha1 '1ed12f29c1f896c1a94237b30201c615af5bb0f8'

  bottle do
    cellar :any
    sha1 "907cfe301a1c318e0dd95cee2be927c0ac918d7e" => :mavericks
    sha1 "f0afe398467227c7373293dbe8f8abe42bdb473a" => :mountain_lion
    sha1 "8bc2be2858d987ffb598b103441c0067dffb4735" => :lion
  end

  option 'with-ssl', 'SSL support'

  def install
    target = (build.with? 'ssl') ? "macosx-ssl" : "macosx"
    system "make", target
    bin.install "stone"
  end
end
