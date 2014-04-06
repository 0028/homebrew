require 'formula'

class Juju < Formula
  homepage 'https://juju.ubuntu.com'
  url 'https://launchpad.net/juju-core/1.18/1.18.0/+download/juju-core_1.18.0.tar.gz'
  sha1 '48bea04a5404de900512fd6399fc8db546993eeb'

  bottle do
    revision 1
    sha1 "8dbed080ee0e8cc3d2f04aaf4b83913293279bc5" => :mavericks
    sha1 "1907327600c198f1c1ce89745600bb45ded515c7" => :mountain_lion
    sha1 "ddcb8ca913b1155c74faa50e6000f9fb948e73ab" => :lion
  end

  depends_on 'go' => :build

  def install
    ENV['GOPATH'] = buildpath
    args = %w(install launchpad.net/juju-core/cmd/juju)
    args.insert(1, "-v") if ARGV.verbose?
    system "go", *args
    bin.install 'bin/juju'
    bash_completion.install "src/launchpad.net/juju-core/etc/bash_completion.d/juju-core"
  end

  test do
    system "#{bin}/juju", "version"
  end
end
