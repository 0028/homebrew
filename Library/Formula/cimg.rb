require 'formula'

class Cimg < Formula
  homepage 'http://cimg.sourceforge.net/'
  url 'https://downloads.sourceforge.net/cimg/CImg-1.5.8.zip'
  sha1 '0c2c5a4ed8656bb9a1319834a4d9a37129aa5d90'

  bottle do
    cellar :any
    sha1 "a5e9522a5547e81531409f13f6e693dd479681d0" => :mavericks
    sha1 "84ffaae7ecf36543b64b4ee565bf692b775a5fad" => :mountain_lion
    sha1 "a2f28527033774a3e76b3cbc67754f5e58d05e28" => :lion
  end

  def install
    include.install 'CImg.h'

    doc.install %w(
      README.txt
      Licence_CeCILL-C_V1-en.txt Licence_CeCILL_V2-en.txt
      html examples)
  end
end
