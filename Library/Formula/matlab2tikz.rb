require 'formula'

class Matlab2tikz < Formula
  homepage 'https://github.com/nschloe/matlab2tikz'
  url 'https://github.com/nschloe/matlab2tikz/archive/0.4.6.tar.gz'
  sha1 '49ad23d87ddd3a9f22f6c74bbe4c4edf064abf65'

  head 'https://github.com/nschloe/matlab2tikz.git'

  bottle do
    cellar :any
    sha1 "6394aff8a13c52601258dbec16b716d07537f4b5" => :mavericks
    sha1 "6f5638e410bf8fdfc289b660f9a47dc44e4ff98d" => :mountain_lion
    sha1 "00aaa8279910844dc35f853ef691ce3efc046ac6" => :lion
  end

  def install
    (share/'matlab2tikz').install Dir['src/*']
  end
end
