require 'formula'

class Sbuild < Formula
  homepage 'http://sbuild.org'
  url 'http://sbuild.org/uploads/sbuild/0.7.3/sbuild-0.7.3-dist.zip'
  sha1 'd41d88ddfccbe6745d7520af40cdf44257ad710c'

  bottle do
    cellar :any
    sha1 "c7970b4c69927dce99b8a511fde902a33cd02025" => :mavericks
    sha1 "e83f9cc0212e8b9f72c3474ede490fdc841563e4" => :mountain_lion
    sha1 "bf5e2251288287e8f2e60faa98a01ceffa2ae3ba" => :lion
  end

  def install
    libexec.install Dir['*']
    system "chmod +x #{libexec}/bin/sbuild"
    bin.install_symlink libexec/"bin/sbuild"
  end

  test do
    system "#{bin}/sbuild", "--help"
  end
end
