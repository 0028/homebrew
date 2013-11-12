require 'formula'

class Nlopt < Formula
  homepage 'http://ab-initio.mit.edu/wiki/index.php/NLopt'
  url 'http://ab-initio.mit.edu/nlopt/nlopt-2.4.tar.gz'
  sha1 'e766f4c49fa5923fb45220f278c01c04c38fc369'

  bottle do
    sha1 'b217101d63ce2186ec99ca5d022f6cbe23a7ef52' => :mavericks
    sha1 '8f2141ad1e6571f932b1ebfe39b53ad8f997f4ef' => :mountain_lion
    sha1 '2b85a2ec2f573b91a4e4d59114498bcfabc325fb' => :lion
  end

  option :cxx11

  def install
    ENV.cxx11 if build.cxx11?
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
