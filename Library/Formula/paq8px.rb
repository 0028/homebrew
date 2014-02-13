require "formula"

class Paq8px < Formula
  homepage "http://dhost.info/paq8/"
  url "http://dhost.info/paq8/paq8px_v69.zip"
  sha1 "77667a3c61b858d71897f47fc4c4d8eabf3d715c"

  bottle do
    cellar :any
    sha1 "7f61e7086060ea296f4c6d642abb82b3ced567f2" => :mavericks
    sha1 "f6821983e387126a18b476a8c1c42fbe7223353e" => :mountain_lion
    sha1 "ab1547481cb9d5169ba510f604cc0254c91188cb" => :lion
  end

  def install
    system "#{ENV.cxx} paq8px_v69.cpp -DUNIX -DNOASM -O2 -Os -fomit-frame-pointer -o paq8px"
    bin.install 'paq8px'
  end
end
