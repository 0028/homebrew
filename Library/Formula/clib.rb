require "formula"

class Clib < Formula
  homepage "https://github.com/clibs/clib"
  url "https://github.com/clibs/clib/archive/1.0.0.tar.gz"
  sha1 "d840b4259190e1b3ce6cc0970f3e9f659226b9d3"

  bottle do
    cellar :any
    sha1 "22b1a98d4ced88a913427ff505db968d98e096a2" => :mavericks
    sha1 "28b9be3b51f004a5710059833a9fd3fb5e0f01a6" => :mountain_lion
    sha1 "dd0a12a7d42de6da655c9a53bde0650689b7efae" => :lion
  end

  def install
    system "make", "install"
  end

  test do
    system "clib", "-v"
  end
end
