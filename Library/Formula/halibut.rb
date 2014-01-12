require 'formula'

class Halibut < Formula
  homepage 'http://www.chiark.greenend.org.uk/~sgtatham/halibut/'
  url 'http://www.chiark.greenend.org.uk/~sgtatham/halibut/halibut-1.0.tar.gz'
  sha1 '1e4643faf2bb4e1843740b8c70635d3d33bb7989'

  bottle do
    cellar :any
    sha1 '931141ba53080d4182b6f2e681b981f76a848bb7' => :mavericks
    sha1 '5dad15a5fad669ab35b279bc4b0d84b60e35080d' => :mountain_lion
    sha1 'b5512e531c404e25481b2bc83a7622785e2c57fa' => :lion
  end

  def install
    bin.mkpath
    man1.mkpath

    system "make", "prefix=#{prefix}", "mandir=#{man}", "all"
    cd "doc" do
      system "make", "prefix=#{prefix}", "mandir=#{man}"
    end
    system "make", "prefix=#{prefix}", "mandir=#{man}", "install"
  end

  test do
    # Initial sanity test
    system "#{bin}/halibut", "--version"

    # Test converting to HTML.
    (testpath/'sample.but').write('Hello, world!')
    system "#{bin}/halibut", "--html=sample.html", "sample.but"

    assert_match /<p>\nHello, world!\n<\/p>/, (testpath/'sample.html').read()
  end
end
