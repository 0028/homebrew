require 'formula'

class Astyle < Formula
  homepage 'http://astyle.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/astyle/astyle/astyle%202.04/astyle_2.04_macosx.tar.gz'
  sha1 '2aa956c4521a1163da6a8be741786fd89c1f39a7'

  bottle do
    cellar :any
    sha1 '8ff553d1291277ad535d18236b9ebbfdee6db4ce' => :mavericks
    sha1 '0f42741a79006f9c7cafb3c10fb0573fa86a77fd' => :mountain_lion
    sha1 '1c74782bdc6678d0e3f8310aa33950d3b8fc2c95' => :lion
  end

  def install
    cd 'src' do
      system "make", "CXX=#{ENV.cxx}", "-f", "../build/mac/Makefile"
      bin.install "bin/astyle"
    end
  end
end
