require "formula"

class Fzf < Formula
  homepage "https://github.com/junegunn/fzf"
  url "https://github.com/junegunn/fzf/archive/0.8.1.tar.gz"
  sha1 "c77827b6a1ca60eb8273ab20eb97c1f78c375452"

  bottle do
    cellar :any
    sha1 "f30e56d1a6b793ea5b932fc14894557b30290583" => :mavericks
    sha1 "2787e333b27e23604f43b0a606ff235a86d2041f" => :mountain_lion
    sha1 "277b6cf3410fa898ce705b16c9dfc1e0efb04a6f" => :lion
  end

  def install
    prefix.install "install", "fzf", "fzf-completion.bash", "fzf-completion.zsh"
    bin.install_symlink prefix/"fzf"
  end

  def caveats; <<-EOS.undent
    To install useful keybindings and fuzzy completion:
      #{prefix}/install
    EOS
  end

  test do
    (testpath/"list").write %w[hello world].join($/)
    `cat #{testpath/"list"} | fzf -f wld`.chomp == "world"
  end
end
