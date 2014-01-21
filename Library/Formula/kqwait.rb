require 'formula'

class Kqwait < Formula
  homepage 'https://github.com/sschober/kqwait'
  url 'https://github.com/sschober/kqwait/archive/kqwait-v1.0.3.tar.gz'
  sha1 '47d12184dc67b7d16ca2895c0ce0de5937fa20cb'

  head 'https://github.com/sschober/kqwait.git'

  bottle do
    cellar :any
    sha1 "de98cc8fe9f359d12502a294331f9eecd03d0c4a" => :mavericks
    sha1 "af7826cb05168a43927b972446fcbc9f1e8d0596" => :mountain_lion
    sha1 "82be05b949bbff7115287f78d0452a31efcb070c" => :lion
  end

  def install
    system "make"
    bin.install "kqwait"
  end

  test do
    system "#{bin}/kqwait", "-v"
  end
end
