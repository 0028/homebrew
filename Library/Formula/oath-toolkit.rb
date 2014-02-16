require 'formula'

class OathToolkit < Formula
  homepage 'http://www.nongnu.org/oath-toolkit/'
  url 'http://download.savannah.gnu.org/releases/oath-toolkit/oath-toolkit-2.4.1.tar.gz'
  bottle do
    sha1 "2f9573253300eecce2eca48827e14c09d9862ecc" => :mavericks
    sha1 "2b10ae41d85018bdce4b6c1a3cbc0f447c28bd89" => :mountain_lion
    sha1 "4826277abcbd4db83e9ba2fc1ebc9cf03edd5254" => :lion
  end

  mirror 'http://download-mirror.savannah.gnu.org/releases/oath-toolkit/oath-toolkit-2.4.1.tar.gz'
  sha1 'b0ca4c5f89c12c550f7227123c2f21f45b2bf969'

  depends_on 'pkg-config' => :build
  depends_on 'libxmlsec1'

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
