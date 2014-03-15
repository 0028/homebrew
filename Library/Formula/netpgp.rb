require "formula"

class Netpgp < Formula
  homepage "http://www.netpgp.com"
  url "http://www.netpgp.com/src/netpgp.tar.gz"
  sha1 "de61bdaaace4778608ab89be1ef6da9bbf5e18ee"
  version "3.99.14"

  bottle do
    cellar :any
    sha1 "f260b7b15271e4eb0271ae46ec3a2984ce235d5e" => :mavericks
    sha1 "3aded2f9c9fd0e775840fad8f63748ce37c6864e" => :mountain_lion
    sha1 "efbd085000c402afe1f652e6a7129a35f47552b5" => :lion
  end

  def install
    ENV["CFLAGS"] = "-Wno-deprecated-declarations"
    system "./configure", "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make", "install"
  end

  test do
    system "#{bin}/netpgp", "--version"
  end
end
