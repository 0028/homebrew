require 'formula'

class BoostBuild < Formula
  homepage 'http://boost.org/boost-build2/'
  url 'http://github.com/boostorg/build/archive/boost-1.55.0.tar.gz'
  sha1 '9daf7587b017716ffd164bcf11d82c4ac00c8ca0'

  head 'https://github.com/boostorg/build.git'

  bottle do
    cellar :any
    sha1 "ec7c604323b4ca5567c3c689571487b62a87ff6d" => :mavericks
    sha1 "9f7a28a1f9454c71a5567f615899b3a78c8042c6" => :mountain_lion
    sha1 "c15aa8370df6f663dbccb751990c13cb6ed7f61d" => :lion
  end

  def install
    if build.head?
      system "./bootstrap.sh"
      system "./b2", "--prefix=#{prefix}", "install"
    else
      cd 'v2' do
        system "./bootstrap.sh"
        system "./b2", "--prefix=#{prefix}", "install"
      end
    end
  end
end
