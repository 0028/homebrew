require 'formula'

class Libmongoclient < Formula
  homepage 'http://www.mongodb.org'
  url 'http://fastdl.mongodb.org/src/mongodb-src-r2.5.4.tar.gz'
  sha1 'ad40b93c9638178cd487c80502084ac3a9472270'

  head 'https://github.com/mongodb/mongo.git'

  bottle do
    sha1 "1e1b92634840e4b8be44368327ff9a5d4403c34a" => :mavericks
    sha1 "1731857701bb40ba328c3c6ceac829158dda3dc0" => :mountain_lion
    sha1 "b2d9c64f8f8872eaae97f19c808257a7f3b906bd" => :lion
  end

  depends_on 'scons' => :build
  depends_on 'boost' => :build

  def install
    boost = Formula.factory('boost').opt_prefix

    args = [
      "--prefix=#{prefix}",
      "-j#{ENV.make_jobs}",
      "--cc=#{ENV.cc}",
      "--cxx=#{ENV.cxx}",
      "--extrapath=#{boost}",
      "--full",
      "--use-system-all",
      "--sharedclient"
    ]

    if MacOS.version >= :mavericks
      args << "--osx-version-min=10.8"
      args << "--libc++"
    end

    scons 'install-mongoclient', *args
  end
end
