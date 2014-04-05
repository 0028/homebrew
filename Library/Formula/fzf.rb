require "formula"

class Fzf < Formula
  homepage "https://github.com/junegunn/fzf"
  url "https://github.com/junegunn/fzf/archive/0.8.3.tar.gz"
  sha1 "9d598e42a3dbbad7df3dfae138a759042e004307"

  bottle do
    cellar :any
    sha1 "175bf55cafc1c7c84d172fbdbd7f4caffdb336ac" => :mavericks
    sha1 "2b78c5b463676794f1ef266ce09e0ea5677503bc" => :mountain_lion
    sha1 "03e3262a41bc1fda4eca7172a2c6fa90e7977b84" => :lion
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
    `cat #{testpath}/list | fzf -f wld`.chomp == "world"
  end
end
