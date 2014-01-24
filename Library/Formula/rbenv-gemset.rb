require 'formula'

class RbenvGemset < Formula
  homepage 'https://github.com/jf/rbenv-gemset'
  url 'https://github.com/jf/rbenv-gemset/archive/v0.5.4.tar.gz'
  sha1 '2f053ec748f1238280a6473732a9bdb0ca305033'

  head 'https://github.com/jf/rbenv-gemset.git'

  bottle do
    cellar :any
    sha1 "2643b44bfe8f45255b4a95ae21dd9b70b7f4c8ad" => :mavericks
    sha1 "f22010660f75551a64e9a14d4b8e24f9dda74e8c" => :mountain_lion
    sha1 "96fb91e286da73171627cdfd51830d3c7eb2718b" => :lion
  end

  depends_on 'rbenv'

  def install
    prefix.install Dir['*']
  end
end
