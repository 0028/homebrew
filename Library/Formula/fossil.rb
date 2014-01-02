require 'formula'

class Fossil < Formula
  homepage 'http://www.fossil-scm.org/'
  # defining 'fossil://' head url causes recursive error in dependency tracking
  url 'http://www.fossil-scm.org/download/fossil-src-20130911114349.tar.gz'
  sha1 '2e2149fff30d63a1869ecb5a7d6b17996477612a'
  version '1.27'

  bottle do
    cellar :any
    sha1 'de9fcd67feec32d333380bc0060f1a423c058a93' => :mavericks
    sha1 '4fa3bc359c4f7c021bc122173407caa7d72112d9' => :mountain_lion
    sha1 'e362bb4461f0d7a218dd3951addae5a75370b931' => :lion
  end

  option 'without-json', 'Build without "json" command support.'
  option 'without-tcl', "Build without the tcl-th1 command bridge."

  def install
    args = []
    args << "--json" if build.with? 'json'
    args << "--with-tcl" if build.with? 'tcl'

    system "./configure", *args
    system "make"
    bin.install 'fossil'
  end
end
