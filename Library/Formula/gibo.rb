require 'formula'

class Gibo < Formula
  homepage 'https://github.com/simonwhitaker/gibo'
  url 'https://github.com/simonwhitaker/gibo/archive/1.0.2.tar.gz'
  sha1 '58c809c99841975a00fbdc540af4b3c478b95c7b'

  bottle do
    cellar :any
    sha1 '8f367e7ef51d2c19777af9dd9f3df320c0e67286' => :mavericks
    sha1 'deeced8536e808e14e91697039703b9569ceb091' => :mountain_lion
    sha1 'a7306d4db31b8e9152d5f6fec317b5468e35bf32' => :lion
  end

  def install
    bin.install "gibo"
    bash_completion.install 'gibo-completion.bash'
    zsh_completion.install 'gibo-completion.zsh' => '_gibo'
  end
end
