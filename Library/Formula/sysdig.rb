require "formula"

class Sysdig < Formula
  homepage "http://www.sysdig.org/"
  url 'https://github.com/draios/sysdig/archive/0.1.73.tar.gz'
  sha1 '2f1133da0256c21c2642dbda57e047a3ae69765f'

  head 'https://github.com/draios/sysdig.git', :branch => 'master'

  bottle do
    sha1 "f82324e614e3c0ae32fd90711cefd7bdeae5b575" => :mavericks
    sha1 "62a9e132a99e6f1d47e458f04ca1477d8626bc52" => :mountain_lion
    sha1 "be0c1e746ecb5f72c76a3b3c4d8b51d627108798" => :lion
  end

  depends_on "cmake" => :build

  def install
    ENV.libcxx if MacOS.version < :mavericks

    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system "#{bin}/sysdig", "-h"
  end
end
