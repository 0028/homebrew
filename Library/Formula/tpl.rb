require "formula"

class Tpl < Formula
  homepage "http://troydhanson.github.io/tpl/"
  url "https://github.com/troydhanson/tpl/archive/v1.6.1.tar.gz"
  sha1 "2ee92627e8f67400061d8fc606b601988ed90217"
  head "https://github.com/troydhanson/tpl.git"

  bottle do
    cellar :any
    sha1 "a000286df1e78d11d5a4276a599c41ebea0a14dc" => :mavericks
    sha1 "eb7112d9f3b0a0264b7cb5813dd5b5d76ebb6f36" => :mountain_lion
    sha1 "80fd43f2f007f5154baf7930ed2468aeec3ff555" => :lion
  end

  option "with-tests", "Verify the build using the test suite."

  depends_on :autoconf
  depends_on :automake
  depends_on :libtool

  def install
    system "autoreconf", "-i"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"

    if build.with? "tests"
      cd "tests" do
        system "make"
      end
    end
  end
end
