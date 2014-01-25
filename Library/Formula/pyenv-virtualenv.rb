require 'formula'

class PyenvVirtualenv < Formula
  homepage 'https://github.com/yyuu/pyenv-virtualenv'
  url 'https://github.com/yyuu/pyenv-virtualenv/archive/v20140110.1.tar.gz'
  sha1 '56e4823b13e00d17c2d73eb8e0c3e5eddc7e3d51'

  head 'https://github.com/yyuu/pyenv-virtualenv.git'

  bottle do
    cellar :any
    sha1 "d47262dd50f591713a7d380d3908a8d74b243f0e" => :mavericks
    sha1 "a029dd5090024a68a47458e39e3a83bab28dd782" => :mountain_lion
    sha1 "bf75069189b449988e21618b2cddf3496a7c7d9f" => :lion
  end

  depends_on 'pyenv'

  def install
    ENV['PREFIX'] = prefix
    system "./install.sh"
  end
end
