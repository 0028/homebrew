require 'formula'

class Matlab2tikz < Formula
  homepage 'https://github.com/nschloe/matlab2tikz'
  url 'https://github.com/nschloe/matlab2tikz/archive/0.4.7.tar.gz'
  sha1 '0e950ae8a29d66610fc68b173f3a014e522ee1be'

  head 'https://github.com/nschloe/matlab2tikz.git'

  bottle do
    cellar :any
    sha1 "d57e758c97af63296a78f32403aa415bc09a8c4c" => :mavericks
    sha1 "8f7e42378c618b41f261b6dc43f1bc071ce9981b" => :mountain_lion
    sha1 "503bb2c342a324e88ef1c634737633d6d052a91b" => :lion
  end

  def install
    (share/'matlab2tikz').install Dir['src/*']
  end
end
