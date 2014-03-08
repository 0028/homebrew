require 'formula'

class Nvm < Formula
  homepage 'https://github.com/creationix/nvm'
  head 'https://github.com/creationix/nvm.git'
  url 'https://github.com/creationix/nvm/archive/v0.2.0.tar.gz'
  sha1 'e0c5b98764194951c984c2b4d325a9fd7cd2cdf2'

  bottle do
    cellar :any
    sha1 "da3243be99be81ff7bc94a534d57a8aa0d0d2353" => :mavericks
    sha1 "6b4f4a98baf632536681231ebabbe25a84135e34" => :mountain_lion
    sha1 "5c606ef6364a2f4c6b8426423ca101a6905fa040" => :lion
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
