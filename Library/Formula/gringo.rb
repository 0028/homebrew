require 'formula'

class Gringo < Formula
  homepage 'http://potassco.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/potassco/gringo/4.2.1/gringo-4.2.1-source.tar.gz'
  sha1 'e27790e7d27c54ebb993d97debc01df5c2a4ddd6'

  bottle do
    cellar :any
    sha1 "3d52d8c19f3864e639594f1658f94cc6aa2d1936" => :mavericks
  end

  depends_on 're2c'  => :build
  depends_on 'scons' => :build
  depends_on 'bison' => :build
  depends_on :macos => :mavericks

  def install
    scons "--build-dir=release", "gringo", "clingo"
    bin.install "build/release/gringo", "build/release/clingo"
  end
end
