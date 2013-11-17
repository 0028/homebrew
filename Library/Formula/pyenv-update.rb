require 'formula'

class PyenvUpdate < Formula
  homepage 'https://github.com/Tacahilo/pyenv-update'
  url 'https://github.com/Tacahilo/pyenv-update/archive/v0.1.zip'
  sha1 '8411ca05314d28222139a82f48f6c6f72d2213f9'

  head 'git@github.com:Tacahilo/pyenv-update.git'

  bottle do
    cellar :any
    sha1 '15c6f7fa429bb984afb96827ad06ec3fdf2f149a' => :mavericks
    sha1 '0d902173e47bf3c29403bec5a0b6d017a0f99965' => :mountain_lion
    sha1 'af880c0de15d1fdbaa880912defc28df8dc6eed7' => :lion
  end

  depends_on 'pyenv'

  def install
    prefix.install Dir['*']
  end
end
