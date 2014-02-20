require 'formula'

class Mdr < Formula
  homepage "https://github.com/halffullheart/mdr"
  url "https://github.com/halffullheart/mdr/archive/v1.0.0.zip"
  sha1 "46f9146e103b9ac8132f773ee6d7903dac066b65"

  bottle do
    cellar :any
    sha1 "7898147b8a13d617f36fdea7ddb367500de00179" => :mavericks
    sha1 "0de8c0170547eec3d87a6eef37aa5fa99992dc06" => :mountain_lion
    sha1 "bc96632f617891b8c77ca4c381f63b3fd905bc01" => :lion
  end

  def install
    system "rake"
    system "rake", "release"
    libexec.install Dir['release/*']
    bin.install_symlink libexec+'mdr'
  end
end
