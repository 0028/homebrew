require 'formula'

class Fleetctl < Formula
  homepage 'https://github.com/coreos/fleet'
  url 'https://github.com/coreos/fleet/archive/v0.1.4.tar.gz'
  sha1 '57e58a6f32de622b56dddb7604de2e50ea9a0390'
  head 'https://github.com/coreos/fleet.git'

  bottle do
    sha1 "bb76af302192860ecba74125823aa0ce77d3c617" => :mavericks
    sha1 "1b27bb64a74caead19ac19d7f853cdd9107916a7" => :mountain_lion
    sha1 "76c1e64b9b28d50310542abc78be82f1e24183ce" => :lion
  end

  depends_on 'go' => :build

  def install
    ENV['GOPATH'] = buildpath
    system "./build"
    bin.install 'bin/fleetctl'
  end
end
