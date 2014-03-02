require 'formula'

class CsvFix < Formula
  homepage 'http://code.google.com/p/csvfix/'
  url 'https://bitbucket.org/neilb/csvfix/get/version-1.3.zip'
  sha1 '2bca2d461434e7bd799e6c886d8eda769e7d3937'

  bottle do
    cellar :any
    sha1 "87256ca1b1d1bbc367374dd24b6a63ea71ad09be" => :mavericks
    sha1 "0439ae2ac9b1f6a8be439912cff1001a4df61a65" => :mountain_lion
    sha1 "097b9a3799cf3ccab43f15fcb0031cda687df3aa" => :lion
  end

  def install
    system "make lin"
    bin.install 'csvfix/bin/csvfix'
  end

  test do
    assert_equal %{"foo","bar"\n}, pipe("#{bin}/csvfix trim", "foo , bar \n")
  end
end
