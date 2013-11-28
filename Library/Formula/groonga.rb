require 'formula'

class Groonga < Formula
  homepage 'http://groonga.org/'
  url 'http://packages.groonga.org/source/groonga/groonga-3.1.0.tar.gz'
  sha1 '7d4ad3be8ade2b97ccf6790063b2b08d111daa59'

  bottle do
    sha1 'd68614e82b2508bcfe1d82018bb0ed441494c4e0' => :mavericks
    sha1 'ed2bd29ac101727937071df4e4d2c626bfdc0b39' => :mountain_lion
    sha1 '4fba3181199130ec1e00922d364722965317bd9b' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'pcre'
  depends_on 'msgpack'

  def install
    # ZeroMQ is an optional dependency that will be auto-detected unless we disable it
    system "./configure", "--prefix=#{prefix}",
                          "--with-zlib",
                          "--disable-zeromq"
    system "make install"
  end
end
