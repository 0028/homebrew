require 'formula'

class SpeedtestCli < Formula
  homepage 'https://github.com/sivel/speedtest-cli'
  url 'https://github.com/sivel/speedtest-cli/archive/v0.2.5.tar.gz'
  sha1 '429406730fcb82408c67fb0d78767e5553bd769e'

  bottle do
    cellar :any
    sha1 "c421e1499bac1a17a79480a5e16a516d0efbea50" => :mavericks
    sha1 "345be61440aefb1157759768b30a0e0bf973602e" => :mountain_lion
    sha1 "87f23ad740e118afbfe70c13bb4f7d510c0987ab" => :lion
  end

  def install
    bin.install 'speedtest_cli.py' => 'speedtest_cli'
  end
end
