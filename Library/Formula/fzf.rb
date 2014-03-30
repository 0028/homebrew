require "formula"

class Fzf < Formula
  homepage "https://github.com/junegunn/fzf"
  url "https://github.com/junegunn/fzf/archive/0.8.2.tar.gz"
  sha1 "b1f497f4bdedcc317425fcc6daeefed5df03eb0f"

  bottle do
    cellar :any
    sha1 "872ec00a3ae7727ed527ebc0703bacfe28e31dfd" => :mavericks
    sha1 "a952742dd6d42725bba089552795ad1f46f3b283" => :mountain_lion
    sha1 "d2c415ae01836abb247bac4a981ee1e1e977a8b6" => :lion
  end

  def install
    prefix.install "install", "fzf", "fzf-completion.bash", "fzf-completion.zsh"
    bin.install_symlink prefix/"fzf"
    (prefix/"plugin").install "plugin/fzf.vim"
  end

  def caveats; <<-EOS.undent
    To install useful keybindings and fuzzy completion:
      #{prefix}/install

    To use fzf in Vim, add the following line to your .vimrc:
      set rtp+=#{prefix}
    EOS
  end

  test do
    (testpath/"list").write %w[hello world].join($/)
    `cat #{testpath/"list"} | fzf -f wld`.chomp == "world"
  end
end
