require 'formula'

class RbenvBundler < Formula
  homepage 'https://github.com/carsomyr/rbenv-bundler'
  url 'https://github.com/carsomyr/rbenv-bundler/archive/0.96.tar.gz'
  sha1 '02339c604c840f24b66523c9faad6ed82500eda1'
  head 'https://github.com/carsomyr/rbenv-bundler.git'

  bottle do
    cellar :any
    sha1 "600601019cf8f135c57bbdee5a34a353984a4818" => :mavericks
    sha1 "ec2d5bd80b2832a31311a9fb427203d4a5b1ed39" => :mountain_lion
    sha1 "153c8202a49a5a975bbc0f1edec8569f7a3c8f66" => :lion
  end

  depends_on 'rbenv'

  def install
    prefix.install Dir['*']
  end
end
