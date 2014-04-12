require 'formula'

class Nvm < Formula
  homepage 'https://github.com/creationix/nvm'
  head 'https://github.com/creationix/nvm.git'
  url 'https://github.com/creationix/nvm/archive/v0.4.0.tar.gz'
  sha1 'e96833c0a7d1611a8cf70a0fd47321aec17f6ca4'

  bottle do
    cellar :any
    sha1 "db6ce0b0953e13dcb93371772b1425f8def41e28" => :mavericks
    sha1 "24b08c6b3f6cfb97d8590856410c0a55df367971" => :mountain_lion
    sha1 "6d3f2b6378a360a5f1f1b08d1e36083583549150" => :lion
  end

  def install
    prefix.install 'nvm.sh'
    bash_completion.install 'bash_completion' => 'nvm'
  end

  def caveats;
    <<-EOS.undent
      Add the following to $HOME/.bashrc, $HOME/.zshrc, or your shell's equivalent configuration file:

        source $(brew --prefix nvm)/nvm.sh

      Type `nvm help` for further information.
    EOS
  end
end
