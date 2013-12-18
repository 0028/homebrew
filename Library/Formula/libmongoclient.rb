require 'formula'

class Libmongoclient < Formula
  homepage 'http://www.mongodb.org'
  url 'http://fastdl.mongodb.org/src/mongodb-src-r2.5.4.tar.gz'
  sha1 'ad40b93c9638178cd487c80502084ac3a9472270'

  head 'https://github.com/mongodb/mongo.git'

  bottle do
    sha1 'b86846313588c26661ee33fdfcf1dea127ffb09f' => :mavericks
    sha1 '10cc7eb53749e280721473e9693b9edefa1e6293' => :mountain_lion
    sha1 'bd2705153f54ff73bd30dd6dc4439a0495078745' => :lion
  end

  depends_on 'scons' => :build
  depends_on 'boost' => :build

  def install
    scons = Formula.factory('scons').opt_prefix/'bin/scons'
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

    system scons, 'install-mongoclient', *args
  end
end
