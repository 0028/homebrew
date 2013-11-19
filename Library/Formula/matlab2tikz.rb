require 'formula'

class Matlab2tikz < Formula
  homepage 'https://github.com/nschloe/matlab2tikz'
  url 'https://github.com/nschloe/matlab2tikz/archive/0.4.3.tar.gz'
  sha1 '6a2e81785e6fa0ba1681dfd5d3c159d08ec91c03'

  head 'https://github.com/nschloe/matlab2tikz.git'

  bottle do
    cellar :any
    sha1 'fcaa2171577efabe0475d999e9c579cb7561da0a' => :mavericks
    sha1 'f5c2ce25e36076013b77db48000df5e62068766c' => :mountain_lion
    sha1 'ca13966d599f649473549ec947fb678456a1ed92' => :lion
  end

  def install
    (share/'matlab2tikz').install Dir['src/*']
  end
end
