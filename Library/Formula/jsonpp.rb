require 'formula'

class Jsonpp < Formula
  homepage 'http://jmhodges.github.io/jsonpp/'
  url 'https://github.com/jmhodges/jsonpp/releases/v1.2.0/715/jsonpp-1.2.0-osx-x86_64.zip'
  version '1.2.0'
  sha1 '422d5b2cefa92923d2fbef9afe1324d72134509e'

  bottle do
    cellar :any
    sha1 "85627d844425664ad4ae7169a7d6c13c6f0c6d80" => :mavericks
    sha1 "423a581d2dfeb980bb565b266c8f8517b3735248" => :mountain_lion
    sha1 "864955a7517816d9e5f1535674085c2d12346de0" => :lion
  end

  def install
    bin.install 'jsonpp'
  end

  test do
    expected = <<-EOS.undent.chomp
      {
        "foo": "bar",
        "baz": "qux"
      }
    EOS
    assert_equal expected, pipe(bin/"jsonpp", '{"foo":"bar","baz":"qux"}')
  end
end
