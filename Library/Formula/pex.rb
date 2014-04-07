require "formula"

class Pex < Formula
  homepage "https://github.com/petere/pex"
  url "https://github.com/petere/pex/archive/5d3ff7b76412ead6f844318c74a2da5fc75d6b52.tar.gz"
  sha1 "3288c90946392257400fcf909432f9a50db5fae6"
  version "1.0"

  depends_on :postgresql

  def install
    system "make", "install"
    system "pex", "init"
  end

  test do
    extensions = `pex --repo`
    assert_match /share\/pex\/packages/, extensions
  end
end
