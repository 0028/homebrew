require 'formula'

class CsvFix < Formula
  homepage 'http://code.google.com/p/csvfix/'
  url 'https://bitbucket.org/neilb/csvfix/get/version-1.3.zip'
  sha1 '2bca2d461434e7bd799e6c886d8eda769e7d3937'

  def install
    system "make lin"
    bin.install 'csvfix/bin/csvfix'
  end

  test do
    assert_equal %{"foo","bar"\n}, pipe("#{bin}/csvfix trim", "foo , bar \n")
  end
end
