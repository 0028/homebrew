require "formula"

class Pex < Formula
  homepage "https://github.com/petere/pex"
  url "https://github.com/petere/pex/archive/1.20140409.tar.gz"
  sha1 "3288c90946392257400fcf909432f9a50db5fae6"
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
