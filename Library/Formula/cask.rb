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
    sha1 "3aa0f43c4b21602122ea247b363cf65d52689779" => :mavericks
    sha1 "114f7cc62cc5ac1060a72317eebf37192ec0dc26" => :mountain_lion
    sha1 "f643ba345526907017e62943adc527158f793e1f" => :lion
  end

  depends_on NewEnoughEmacs

  def install
    zsh_completion.install "etc/cask_completion.zsh"
    bin.install "bin/cask"
    prefix.install Dir["*.el"]
    prefix.install "templates"
    # Stop cask performing self-upgrades.
    touch prefix/".no-upgrade"
  end
end
