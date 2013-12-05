require 'formula'

class Unrar < Formula
  homepage 'http://www.rarlab.com'
  url 'http://www.rarlab.com/rar/unrarsrc-5.0.14.tar.gz'
  sha1 'f6826b330668698fca227b3331e2bab564932d7e'

  bottle do
    cellar :any
    sha1 '5432556420d6232b9863b1da546dced40fd649c3' => :mavericks
    sha1 'd489a66d0dac1b207968faeb0b914235a473b16f' => :mountain_lion
    sha1 'a9e57f0791936e88a3601f95c95aa69aea6bf6aa' => :lion
  end

  def install
    system "make"
    bin.install 'unrar'
  end
end
