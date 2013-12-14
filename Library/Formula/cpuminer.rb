require 'formula'

class Cpuminer < Formula
  homepage 'https://github.com/pooler/cpuminer'
  url 'http://downloads.sourceforge.net/project/cpuminer/pooler-cpuminer-2.2.3.tar.gz'
  sha1 '985ad94db5bd6579dff42933f7fe99f1ba45b364'
  head 'https://github.com/pooler/cpuminer.git'

  bottle do
    cellar :any
    sha1 'c95d7c2cad2df0c1401fd6587723da238fc36ea1' => :mavericks
    sha1 'b44c979928924a8ed1e6072493c4742722c0e547' => :mountain_lion
    sha1 '4a3be6cf2caf0e26335268c173d33ceb1bc320c4' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'autoconf' => :build if build.head?
  depends_on 'automake' => :build if build.head?
  depends_on 'curl'
  depends_on 'jansson'

  def install
    system "./autogen.sh" if build.head?
    system "./nomacro.pl"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
