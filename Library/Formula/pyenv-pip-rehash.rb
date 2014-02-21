require 'formula'

class PyenvPipRehash < Formula
  homepage 'https://github.com/yyuu/pyenv-pip-rehash'
  url 'https://github.com/yyuu/pyenv-pip-rehash/archive/v0.0.3.tar.gz'
  sha1 'c0d354c7886aed142a46dfd8cf427a7000f40896'

  head 'https://github.com/yyuu/pyenv-pip-rehash.git'

  bottle do
    cellar :any
    sha1 "1d4682989262c1cb031977e9611f25b73d26a38c" => :mavericks
    sha1 "403700f2b8a7395fc9e9452f56376834cddc226e" => :mountain_lion
    sha1 "f3b284e703d23ac293e360a3303d82b1ae204a1c" => :lion
  end

  depends_on 'pyenv'

  def install
    ENV['PREFIX'] = prefix
    system "./install.sh"
  end

  test do
    %x(pyenv hooks exec).include?('pip.bash')
  end
end
