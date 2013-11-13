require 'formula'

class Libbson < Formula
  homepage 'https://github.com/mongodb/libbson'
  url 'https://github.com/mongodb/libbson/releases/download/0.2.4/libbson-0.2.4.tar.gz'
  sha1 '53972c042f7d453e172132fe499b21a216746b9d'

  bottle do
    sha1 'a0226e7ae74fd0fed93a2db776007d2ef06b52e4' => :mavericks
    sha1 '9b756f984910014ffaf1e6cbfb559a5185cb6cda' => :mountain_lion
    sha1 '1dd66c5dc9422b2fe2570796a03c294c7505d34a' => :lion
  end

  depends_on :automake => :build

  def install
    system "./configure", "--enable-silent-rules", "--prefix=#{prefix}"
    system "make", "install"
  end
end
