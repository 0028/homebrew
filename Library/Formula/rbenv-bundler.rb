require 'formula'

class RbenvBundler < Formula
  homepage 'https://github.com/carsomyr/rbenv-bundler'
  url 'https://github.com/carsomyr/rbenv-bundler/archive/0.96.tar.gz'
  sha1 '02339c604c840f24b66523c9faad6ed82500eda1'
  head 'https://github.com/carsomyr/rbenv-bundler.git'

  bottle do
    cellar :any
    sha1 'd9777d7ff9cd52d721b5da7d389c6fe38791bd98' => :mavericks
    sha1 '48ccfd7975bb99a55308e3df8f256daeb723e801' => :mountain_lion
    sha1 '70dd58f62f95d357757c203c562ca31b7f5d3f52' => :lion
  end

  depends_on 'rbenv'

  def install
    prefix.install Dir['*']
  end
end
