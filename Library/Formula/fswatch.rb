require 'formula'

class Fswatch < Formula
  homepage 'https://github.com/alandipert/fswatch'
  url 'https://github.com/alandipert/fswatch/archive/r0.0.2.tar.gz'
  sha1 '80dcf0d4af0b28f1b777528050f2e094218cee5f'
  version '0.0.1'

  bottle do
    cellar :any
    sha1 '43165af6c889443dfc2b1a949131334d4263da71' => :mavericks
    sha1 'e29704e19cedc9d4b8238ca0ab8b354a65cb57a1' => :mountain_lion
    sha1 '959b1a9b096cb7e4b928ba42fbd84c2d57564a48' => :lion
  end

  def install
    system 'make'
    bin.install 'fswatch'
  end

  test do
    system "fswatch 2>&1| grep 'You must specify a directory to watch'"
  end
end
