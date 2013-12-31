require 'formula'

class RbenvGemset < Formula
  homepage 'https://github.com/jf/rbenv-gemset'
  url 'https://github.com/jf/rbenv-gemset/archive/v0.5.3.tar.gz'
  sha1 '5fc4cee421ae1711a60ed8fb861ee2704211057b'

  head 'https://github.com/jf/rbenv-gemset.git'

  bottle do
    cellar :any
    sha1 '487da165ce986139d034ed00fc51d2ca83960438' => :mavericks
    sha1 '3e9d8c00f32ce6359d07c313ced6b2011c7c1eae' => :mountain_lion
    sha1 'e6c8ac2ab0d3593468a1240a7441001c268196ec' => :lion
  end

  depends_on 'rbenv'

  def install
    prefix.install Dir['*']
  end
end
