require "formula"

class Pex < Formula
  homepage "https://github.com/petere/pex"
  url "https://github.com/petere/pex/archive/1.20140409.tar.gz"
  sha1 "7cc652cd89bc6c6bf2488c8eb1ee91588053262a"
  version "1.0"

  depends_on :postgresql

  def pex(bin=nil)
    if bin
      "#{bin}/pex"
    else
      "pex"
    end
  end

  def pex_repo(bin=nil)
    `#{pex(bin)} --repo`.strip
  end

  def install
    system "make", "install", "prefix=#{prefix}", "mandir=#{man}"
  end

  def caveats; <<-EOS.undent
    After installation you need to perform a

    pex --init

    in order to setup the necessary directory structure.
    EOS
  end

  test do
    assert_match /share\/pex\/packages/, pex_repo
  end
end
