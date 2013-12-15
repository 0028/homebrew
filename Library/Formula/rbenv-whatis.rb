require 'formula'

class RbenvWhatis < Formula
  homepage 'https://github.com/rkh/rbenv-whatis'
  url 'https://github.com/rkh/rbenv-whatis/archive/v1.0.0.tar.gz'
  sha1 '8c802d8e2bba66d0c87c62c9d0b887beb52b1de4'

  bottle do
    cellar :any
    sha1 'b2d53fc79dc2d905a383886f6ebb38deb000c42e' => :mavericks
    sha1 '7f14caa943245b6494b1d8fe4634a8270a770d87' => :mountain_lion
    sha1 'c728ae4ebf10ebee05f8a9ae9a02307a42aa74f2' => :lion
  end

  depends_on 'rbenv'

  def install
    prefix.install Dir['*']
  end
end
