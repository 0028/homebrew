require 'formula'

class Basex < Formula
  homepage 'http://basex.org'
  url 'http://files.basex.org/releases/7.8/BaseX78.zip'
  version '7.8'
  sha1 'a0aa765aa5090dfff803a777fee15d3e04bdbfad'

  bottle do
    cellar :any
    sha1 "cde1317808b129dfe1d77e70b8e449110b0c6f12" => :mavericks
    sha1 "0847aac78c86a54101b903e822d8c960aecc0f5d" => :mountain_lion
    sha1 "e6df71ded49ff7bb72753b564af22f811c64b1f2" => :lion
  end

  def install
    rm Dir['bin/*.bat']
    rm_rf "repo"
    rm_rf "data"
    rm_rf "etc"
    prefix.install_metafiles
    libexec.install Dir['*']
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    require 'open3'
    Open3.popen3("#{bin}/basex", "1 to 10") do |_, stdout, _|
      assert_equal "1 2 3 4 5 6 7 8 9 10", stdout.read
    end
  end
end
