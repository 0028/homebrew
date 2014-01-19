require 'formula'

class Gringo < Formula
  homepage 'http://potassco.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/potassco/gringo/4.2.1/gringo-4.2.1-source.tar.gz'
  sha1 'e27790e7d27c54ebb993d97debc01df5c2a4ddd6'

  bottle do
    cellar :any
    sha1 "4440896f8b8f24886d44b9cf2d36cfd12700af04" => :mavericks
  end

  depends_on 're2c'  => :build
  depends_on 'scons' => :build
  depends_on 'bison' => :build
  depends_on :macos => :mavericks

  def install
    system "scons", "--build-dir=release", "gringo", "clingo"
    bin.install "build/release/gringo", "build/release/clingo"
  end
end
