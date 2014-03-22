require 'formula'

class RbenvGemset < Formula
  homepage 'https://github.com/jf/rbenv-gemset'
  url 'https://github.com/jf/rbenv-gemset/archive/v0.5.6.tar.gz'
  sha1 'fc3e190e416d58a4184cab49a626f3606d975427'

  head 'https://github.com/jf/rbenv-gemset.git'

  bottle do
    cellar :any
    sha1 "3e79433a703f1e945df933595d7406684602f644" => :mavericks
    sha1 "b493feeaca4237a093c6adc097dc23abefc4b571" => :mountain_lion
    sha1 "7d4a0b27a47c143bf4208733079372dc0a650e92" => :lion
  end

  depends_on 'rbenv'

  def install
    prefix.install Dir['*']
  end
end
