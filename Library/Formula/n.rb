require 'formula'

class N < Formula
  homepage 'https://github.com/visionmedia/n'
  head 'https://github.com/visionmedia/n.git'
  url 'https://github.com/visionmedia/n/archive/1.2.1.tar.gz'
  sha1 'c8a54313ee8ff43f3b6cdb03f140bc200f548f9f'

  bottle do
    cellar :any
    sha1 "a44d9084794af65733c5206315326e331305573d" => :mavericks
    sha1 "14d57e47d4dc3116cdeffb5c6534e184dc4ab8da" => :mountain_lion
    sha1 "7125e729f2ed657c915796bc4a87eb6609a21db9" => :lion
  end

  def install
    bin.mkdir
    system "make", "PREFIX=#{prefix}", "install"
  end
end
