require 'formula'

class Ejdb < Formula
  homepage 'http://ejdb.org/'
  url 'https://github.com/Softmotions/ejdb/archive/v1.1.25.tar.gz'
  sha1 'be8a864286f2b28922a04c9ba3f9eac830d8ebdd'

  bottle do
    cellar :any
    sha1 '3118ee4913e3d97054fe1a71e9fd110ea2c2ac49' => :mavericks
    sha1 '75db2a3952e6058c363c25b6be2220dfcb6bcc8a' => :mountain_lion
    sha1 'fe5d781e2a60448648cc56c0a0620216aad5d768' => :lion
  end

  def install
    cd 'tcejdb' do
      system "./configure", "--prefix=#{prefix}", "--disable-debug"
      system "make"
      system "make install"
    end
  end
end
