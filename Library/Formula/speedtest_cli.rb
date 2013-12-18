require 'formula'

class SpeedtestCli < Formula
  homepage 'https://github.com/sivel/speedtest-cli'
  url 'https://github.com/sivel/speedtest-cli/archive/v0.2.4.tar.gz'
  sha1 '21f0f80b05f3f05adf9a8802e3cd86caa0325e43'

  bottle do
    cellar :any
    sha1 '599d9d2527f0d24368e1e7309c0747b5cc03f9a8' => :mavericks
    sha1 '73506cbcfa8cd5cda1563e6f16c2a58e23d0e85a' => :mountain_lion
    sha1 '6e301f3ed6192ebe28d4c3c0e28bddb5e212f77f' => :lion
  end

  def install
    bin.install 'speedtest_cli.py' => 'speedtest_cli'
  end
end
