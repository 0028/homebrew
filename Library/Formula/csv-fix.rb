require 'formula'

class CsvFix < Formula
  homepage 'http://code.google.com/p/csvfix/'
  url 'https://bitbucket.org/neilb/csvfix/get/version-1.3.zip'
  sha1 '2bca2d461434e7bd799e6c886d8eda769e7d3937'

  bottle do
    cellar :any
    sha1 "6111ba4d37f66f8924e43e90bd8d5852d6a48294" => :mavericks
    sha1 "32fef2204779c6e2ea553ba3db99e9a7552c2ef6" => :mountain_lion
    sha1 "877abd351cc76774bd52e9c8398cee609f8319a4" => :lion
  end

  def install
    system "make lin"
    bin.install 'csvfix/bin/csvfix'
  end

  test do
    IO.popen("#{bin}/csvfix trim", "w+") do |pipe|
      pipe.write "foo , bar \n"
      pipe.close_write
      assert_equal %{"foo","bar"\n}, pipe.read
    end
  end
end
