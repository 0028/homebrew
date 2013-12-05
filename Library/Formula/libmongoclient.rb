require 'formula'

class Libmongoclient < Formula
  homepage 'http://www.mongodb.org'
  url 'http://fastdl.mongodb.org/src/mongodb-src-r2.5.4.tar.gz'
  sha1 'ad40b93c9638178cd487c80502084ac3a9472270'

  head 'https://github.com/mongodb/mongo.git'

  bottle do
    cellar :any
    sha1 'f142506f6d23fc8ecf9d709904a9f671c230075a' => :mavericks
    sha1 'cf497f6bfdcbe24c8d9fbeb15dc6c264c66bdac7' => :mountain_lion
    sha1 '794145dc64c84d1e73248abd32380f66dc1d3419' => :lion
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
