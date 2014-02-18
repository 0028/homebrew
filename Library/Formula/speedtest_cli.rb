require 'formula'

class SpeedtestCli < Formula
  homepage 'https://github.com/sivel/speedtest-cli'
  url 'https://github.com/sivel/speedtest-cli/archive/v0.2.5.tar.gz'
  sha1 '429406730fcb82408c67fb0d78767e5553bd769e'

  bottle do
    cellar :any
    sha1 "c2f818c4167d738df1c74f0158b5c667641550d3" => :mavericks
    sha1 "81b37e461a005bcf4b49e0981dbaa9f40d618465" => :mountain_lion
    sha1 "08a98d1b6329417894846d6388a874d6a21eb06f" => :lion
  end

  def install
    bin.install 'speedtest_cli.py' => 'speedtest_cli'
  end
end
