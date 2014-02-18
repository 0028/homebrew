require 'formula'

class Capstone < Formula
  homepage 'http://capstone-engine.org'
  url 'http://capstone-engine.org/download/2.0/capstone-2.0.tgz'
  sha1 '209cdc69518f754c5d7d07672d8e28cdda9feae7'

  bottle do
    cellar :any
    sha1 "451a0bafac47956e5e044a7699af073cdc2fe73f" => :mavericks
    sha1 "70ff7d3df2ce66e06f01179bb60267445ffceb21" => :mountain_lion
    sha1 "56c12e507b4da4eee65d6a97b35067bb216f4580" => :lion
  end

  def install
    inreplace 'Makefile', 'lib64', 'lib'
    system "./make.sh"
    ENV["PREFIX"] = prefix
    system "./make.sh", "install"
  end
end
