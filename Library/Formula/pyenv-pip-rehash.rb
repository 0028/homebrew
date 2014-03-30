require 'formula'

class PyenvPipRehash < Formula
  homepage 'https://github.com/yyuu/pyenv-pip-rehash'
  url 'https://github.com/yyuu/pyenv-pip-rehash/archive/v0.0.4.tar.gz'
  sha1 'afbce380b888c987138f28d33fe1ba5a38cdb41a'

  head 'https://github.com/yyuu/pyenv-pip-rehash.git'

  bottle do
    cellar :any
    sha1 "5d43120bdaf5614c2c8011c99629a3465fc25d07" => :mavericks
    sha1 "2188b5ffaac40d066c9a5d226e68a78a4ea86861" => :mountain_lion
    sha1 "918449b6ed161fb8befd222fc4a7ba57b5c1bb21" => :lion
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
