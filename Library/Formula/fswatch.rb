require 'formula'

class Fswatch < Formula
  homepage 'https://github.com/alandipert/fswatch'
  url 'https://github.com/alandipert/fswatch/archive/r0.0.2.tar.gz'
  sha1 '80dcf0d4af0b28f1b777528050f2e094218cee5f'
  version '0.0.1'

  def install
    system 'make'
    bin.install 'fswatch'
  end

  test do
    system "fswatch 2>&1| grep 'You must specify a directory to watch'"
  end
end
