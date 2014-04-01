require "formula"

class NewEnoughEmacs < Requirement
  fatal true
  default_formula "emacs"

  def satisfied?
    major_version = `emacs --batch --eval "(princ emacs-major-version)"`.to_i
    major_version >= 23
  end

  def message
    "Emacs 23 or later is required to run cask."
  end
end

class Cask < Formula
  homepage "http://cask.github.io/"
  url "https://github.com/cask/cask/archive/v0.6.0.tar.gz"
  sha1 "6f836bb41f034d6be9611ee09c78eb8cc52b53ca"
  head "https://github.com/cask/cask.git"

  bottle do
    cellar :any
    sha1 "0b91e8927299c8f4923a80ad34a34383d0aa8ef9" => :mavericks
    sha1 "8f5f04de95ab93a1c5e5f57c27f60757ac259021" => :mountain_lion
    sha1 "eb201fa948a755667554073c4caee728445795ea" => :lion
  end

  depends_on NewEnoughEmacs

  def install
    zsh_completion.install "etc/cask_completion.zsh"
    bin.install "bin/cask"
    prefix.install Dir["*.el"]
    prefix.install "templates"
    (share/"emacs/site-lisp").install_symlink "#{prefix}/cask-bootstrap.el"
    (share/"emacs/site-lisp").install_symlink "#{prefix}/cask.el"
    # Stop cask performing self-upgrades.
    touch prefix/".no-upgrade"
  end
end
