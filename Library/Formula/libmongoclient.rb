require 'formula'

class Libmongoclient < Formula
  homepage 'http://www.mongodb.org'
  url 'https://github.com/mongodb/mongo-cxx-driver/archive/legacy-0.0-26compat-2.6.0.tar.gz'
  sha1 '16489b9afb506bf30e514152af7b5a49bbdb2486'

  head 'https://github.com/mongodb/mongo-cxx-driver.git', :branch => "26compat"

  bottle do
    sha1 "98a1bd98ca83de3092dcaed287eef99f2cb9e8dd" => :mavericks
    sha1 "fd77062048787edb479ace8ab9a11a7c5e464be2" => :mountain_lion
    sha1 "39437aad6921d20e6a00a80c005a26beeed79510" => :lion
  end

  depends_on 'scons' => :build
  depends_on 'boost' => :build

  def install
    boost = Formula["boost"].opt_prefix

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

    scons *args
  end
end
