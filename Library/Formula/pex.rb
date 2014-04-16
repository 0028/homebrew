require "formula"

class Pex < Formula
  homepage "https://github.com/petere/pex"
  url "https://github.com/petere/pex/archive/1.20140409.tar.gz"
  sha1 "7cc652cd89bc6c6bf2488c8eb1ee91588053262a"
  version "1.0"

  depends_on :postgresql

  def install
    system "make", "install"
    system "pex", "init" unless File.directory?(`pex --repo`.strip)
  end

  test do
    extensions = `pex --repo`
    assert_match /share\/pex\/packages/, extensions
  end
end
