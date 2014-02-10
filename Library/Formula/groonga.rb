require 'formula'

class Groonga < Formula
  homepage 'http://groonga.org/'
  url 'http://packages.groonga.org/source/groonga/groonga-4.0.0.tar.gz'
  sha1 '9a64d4c98eda4db563bcaf9464504d24dfdb3ff4'

  bottle do
    sha1 "c9660c3cdba06030f7f69107b6f0fe82d0f9b03f" => :mavericks
    sha1 "f3bd19f271becb5c8c15cdfc4e3f5effecfb84ef" => :mountain_lion
    sha1 "24fe5fa178270010045d4c19b3e55caa1720f842" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'pcre'
  depends_on 'msgpack'

  depends_on 'glib' if build.include? 'enable-benchmark'

  option 'enable-benchmark', "Enable benchmark program for developer use"

  def install
    args = %W[
      --prefix=#{prefix}
      --with-zlib
      --disable-zeromq
    ]

    if build.include? 'enable-benchmark'
      args << '--enable-benchmark'
    end

    # ZeroMQ is an optional dependency that will be auto-detected unless we disable it
    system "./configure", *args
    system "make install"
  end
end
