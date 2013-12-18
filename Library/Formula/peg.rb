require 'formula'

class Peg < Formula
  homepage 'http://piumarta.com/software/peg/'
  url 'http://piumarta.com/software/peg/peg-0.1.15.tar.gz'
  sha1 '85b8d85f3f6678372624d5013372ca7175604976'

  bottle do
    cellar :any
    sha1 '915b587b23dd118c27093a4ca20d7024c3f026b6' => :mavericks
    sha1 'fb1156ced0db18e1f56d06db3495869c419ffa5a' => :mountain_lion
    sha1 '2c73b5eab04016f8cbd17c22f95a2e6781c08f27' => :lion
  end

  def install
    system "make all"
    bin.install %w[peg leg]
    man1.install gzip("src/peg.1")
  end
end
