require "formula"

class Stm32flash < Formula
  homepage "https://code.google.com/p/stm32flash/"
  url "https://stm32flash.googlecode.com/files/stm32flash-0.3beta2.tar.gz"
  sha1 "ab20f3b0598a1354cc73c36b2c977ca42fa57d91"
  version "0.3beta2"
  head "git://gitorious.org/stm32flash/stm32flash.git"

  bottle do
    cellar :any
    sha1 "62931c62f369ecfa01237e0e4c189d4137f57626" => :mavericks
    sha1 "196b3e551e50e8a55ce8d436d44221b908767618" => :mountain_lion
    sha1 "c9fae0eb10bf7567b749b6680bb7236144a15163" => :lion
  end

  stable do
    # Create manual page folder in Makefile install target
    patch do
      url "https://gitorious.org/stm32flash/stm32flash/commit/7af2d66ad29c156176c6f62b1045cd354294b12a.diff"
      sha1 "872e15cf98e691a7ca02b5a8a0af09cfaad26881"
    end

    # Exit with success when -h option is used to show help message
    patch do
      url "https://gitorious.org/stm32flash/stm32flash/commit/4d7ce4572f6a2d5977d505bef60e94346f7866e9.diff"
      sha1 "5920e6dceddd1e878c753cfa173724aacf62397c"
    end
  end

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    system "#{bin}/stm32flash", "-h"
  end
end
