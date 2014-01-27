require 'formula'

class RbenvCtags < Formula
  homepage 'https://github.com/tpope/rbenv-ctags'
  url 'https://github.com/tpope/rbenv-ctags/archive/v1.0.1.tar.gz'
  sha1 '551ce03a0f6709dd2209c2bd319344f521769420'

  head 'https://github.com/tpope/rbenv-ctags.git'

  bottle do
    cellar :any
    sha1 "55b31226a333127bc1da7e1b1e3ecfc3a0a49fb9" => :mavericks
    sha1 "5179021ba4f372b2faacb26c57b5aa2369275516" => :mountain_lion
    sha1 "cb7e5405e7c677b65db6474f7c689bf4f01e79fd" => :lion
  end

  depends_on 'rbenv'
  depends_on 'ruby-build'
  depends_on 'ctags'

  def install
    prefix.install Dir['*']
  end
end
