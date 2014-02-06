require 'formula'

class NewEnoughEmacs < Requirement
  fatal true

  def satisfied?
    major_version = `emacs --batch --eval '(princ emacs-major-version)'`.to_i
    major_version >= 23
  end

  def message
    "Emacs 23 or later is required to install cask."
  end

  default_formula "emacs"

end

class Cask < Formula
  homepage 'http://cask.github.io/'
  url 'https://github.com/cask/cask/archive/v0.5.2.zip'
  sha1 '0178e1b9a3ea80ad91e8a2d25ee3cdf7f782876f'
  head 'https://github.com/cask/cask.git'

  bottle do
    cellar :any
    sha1 "090be563ee7dfc1f8f7113c4a23975d0be161022" => :mavericks
    sha1 "447b02355f26d5997b83d62a2e8fc7a091d85ed2" => :mountain_lion
    sha1 "c561466a6a9ff626e5f5bf49695db6d337bc2f40" => :lion
  end

  depends_on NewEnoughEmacs

  def install
    zsh_completion.install 'etc/cask_completion.zsh'
    bin.install 'bin/cask'
    prefix.install Dir['*.el']
    prefix.install 'templates'
    # Cask will refuse to upgrade in the presence of this file
    # Homebrew updates will therefore work more reliably
    touch prefix/".no-upgrade"
  end

end
