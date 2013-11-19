require 'formula'

class Cimg < Formula
  homepage 'http://cimg.sourceforge.net/'
  url 'http://downloads.sourceforge.net/cimg/CImg-1.5.7.zip'
  sha1 '399e332b982b4ca0bcb27ea4f6763fd84a3b8457'

  bottle do
    cellar :any
    sha1 'b51adcf0921d808fcb154b82da2c529059a1bad7' => :mavericks
    sha1 'da6ce6f2a10c9bd48017fb532c349a60dcdc9c9a' => :mountain_lion
    sha1 'e2ad425f6e73d38098b916240385bde276b9c38d' => :lion
  end

  def install
    include.install 'CImg.h'

    doc.install %w(
      README.txt
      Licence_CeCILL-C_V1-en.txt Licence_CeCILL_V2-en.txt
      html examples)
  end
end
