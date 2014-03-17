require 'formula'

class Spin < Formula
  homepage 'http://spinroot.com/spin/whatispin.html'
  url 'http://spinroot.com/spin/Src/spin627.tar.gz'
  version '6.2.7'
  sha1 '26969c8aa6ad46df1ce38b5c239d26553817da36'

  bottle do
    cellar :any
    sha1 "c4f270104d39406e3b7af7798edf20fd5ccc784a" => :mavericks
    sha1 "8abee565c290abdad7e9911e52460dbc254d89d8" => :mountain_lion
    sha1 "96f22efbbe40e7bfcbb34dbb9ee50826b61e2704" => :lion
  end

  fails_with :llvm do
    build 2334
  end

  def install
    ENV.deparallelize

    cd "Src#{version}" do
      system "make"
      bin.install "spin"
    end

    bin.install "iSpin/ispin.tcl" => "ispin"
    man1.install "Man/spin.1"
  end
end
