require 'formula'

class RbenvBundler < Formula
  homepage 'https://github.com/carsomyr/rbenv-bundler'
  url 'https://github.com/carsomyr/rbenv-bundler/archive/0.96.tar.gz'
  sha1 '02339c604c840f24b66523c9faad6ed82500eda1'
  head 'https://github.com/carsomyr/rbenv-bundler.git'

  bottle do
    cellar :any
    sha1 "6d36568b7a151e2d102e15b1feb7d812f1939e62" => :mavericks
    sha1 "9a1b8b9a12c1abab7991b8195da336dcbf96f52d" => :mountain_lion
    sha1 "7d2016d62f7b8a06f530a199df3c6f45445e0933" => :lion
  end

  depends_on 'rbenv'

  def patches
    'https://github.com/carsomyr/rbenv-bundler/commit/0aebf2.patch'
  end

  def install
    prefix.install Dir['*']
  end
end
