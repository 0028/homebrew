require 'formula'

class RbenvBundler < Formula
  homepage 'https://github.com/carsomyr/rbenv-bundler'
  url 'https://github.com/carsomyr/rbenv-bundler/archive/0.97.tar.gz'
  sha1 'a31e0893465566db8e5c11c555b2ba0d314a869b'
  head 'https://github.com/carsomyr/rbenv-bundler.git'

  bottle do
    cellar :any
    sha1 "9d5ad5819e293d951cbef9b33d436df4c123b92b" => :mavericks
    sha1 "51eda66dc5036e310435ee3ce736be66a97e2cb8" => :mountain_lion
    sha1 "5290dbfedff5bbdaffda8790d97d77385dfb39c0" => :lion
  end

  depends_on 'rbenv'

  def install
    prefix.install Dir['*']
  end
end
