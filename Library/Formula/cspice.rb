require "formula"

class Cspice < Formula
  homepage "http://naif.jpl.nasa.gov/naif/index.html"
  url "http://naif.jpl.nasa.gov/pub/naif/toolkit//C/MacIntel_OSX_AppleC_64bit/packages/cspice.tar.Z"
  sha1 "e5546a72a2d0c7e337850a10d208014efb57d78d"
  version "64"

  bottle do
    cellar :any
    sha1 "db2673dd52a49c1bdf5a0b47b235556f684698a4" => :mavericks
    sha1 "d7beca492dea34ab3866d9ff8b1cb767a676b039" => :mountain_lion
    sha1 "547cb69a69917f48b4e8bbed0748468b36d90ca5" => :lion
  end

  def install
    rm_f Dir["lib/*"]
    rm_f Dir["exe/*"]
    system "csh", "makeall.csh"
    mv "exe", "bin"
    prefix.install Dir["*"]

    Dir["#{lib}/*"].each do |file|
      symlink file, "#{lib}"+"/lib"+File.basename(file)
    end

  end

  test do
    system "#{bin}/tobin #{prefix}/data/cook_01.tsp DELME"
  end
end
