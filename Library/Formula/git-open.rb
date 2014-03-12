require "formula"

class GitOpen < Formula
  homepage "https://github.com/jeffreyiacono/git-open"
  url "https://github.com/jeffreyiacono/git-open/archive/v1.1.tar.gz"
  sha1 "86a2a9b67e5fe20779b2ae7ad59a3450c7c72d23"

  bottle do
    cellar :any
    sha1 "6397e18fc073059838b7531d4b3eccfba01b1f07" => :mavericks
    sha1 "1f3e5537190dd58a0b1871025bb95e309aa59600" => :mountain_lion
    sha1 "9db6203cd31025a25ec889f7c1d52d432843b7c9" => :lion
  end

  def install
    bin.install "git-open.sh" => "git-open"
  end
end
