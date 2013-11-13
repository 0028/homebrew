require 'formula'

class Libmongoclient < Formula
  homepage 'http://www.mongodb.org'
  url 'http://fastdl.mongodb.org/src/mongodb-src-r2.5.3.tar.gz'
  sha1 '8fbd7f6f2a55092ae0e461ee0f5a4a7f738d40c9'

  head 'https://github.com/mongodb/mongo.git'

  bottle do
    cellar :any
    sha1 '65cd23a64e276774a3c5f534fdb0849e280f5880' => :mavericks
    sha1 '43da4b1bc7f518df89a115056259f7f0a9abc98e' => :mountain_lion
    sha1 'e0fe382b79c7d5ed0c43c3e4c042ae2d3e482f91' => :lion
  end

  depends_on 'scons' => :build
  depends_on 'boost' => :build

  def install
    args = [
      "--prefix=#{prefix}",
      "-j#{ENV.make_jobs}",
      "--cc=#{ENV.cc}",
      "--cxx=#{ENV.cxx}",
      "--full",
      "--use-system-all",
      "--sharedclient"
    ]

    if MacOS.version >= :mavericks
      args << "--osx-version-min=10.8"
      args << "--libc++"
    end

    system 'scons', 'install-mongoclient', *args
  end
end
