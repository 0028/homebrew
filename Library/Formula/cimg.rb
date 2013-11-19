require 'formula'

class Cimg < Formula
  homepage 'http://cimg.sourceforge.net/'
  url 'http://downloads.sourceforge.net/cimg/CImg-1.5.7.zip'
  sha1 '399e332b982b4ca0bcb27ea4f6763fd84a3b8457'

  bottle do
    cellar :any
    sha1 '511e7e73486c9127f3508f588986804b249f429f' => :mavericks
    sha1 '5634486c1070ce748d01e2694c772fced641c9b2' => :mountain_lion
    sha1 '6d0e29f39c0ae963df3a71a72be1d1c7a5a133ec' => :lion
  end

  def install
    include.install 'CImg.h'

    doc.install %w(
      README.txt
      Licence_CeCILL-C_V1-en.txt Licence_CeCILL_V2-en.txt
      html examples)
  end
end
