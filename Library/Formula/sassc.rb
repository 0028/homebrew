require 'formula'

class Sassc < Formula
  homepage 'https://github.com/hcatlin/sassc'
  url 'https://github.com/hcatlin/sassc/archive/v1.0.1.tar.gz'
  sha1 '69e7d97264b252593a3307330a96a5ccdc2813b5'

  bottle do
    cellar :any
    sha1 '6fbe80a2d87eae5c5e5a5da36a94c4f987479a15' => :mavericks
    sha1 '0dfa2e34a17ad41d828841654e39979ae4791204' => :mountain_lion
    sha1 'e4d0905a44200f7edcde04dac9548911a19b8d3e' => :lion
  end

  depends_on :autoconf
  depends_on :automake
  depends_on :libtool
  depends_on 'libsass'

  def install
    system "autoreconf -i"
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
