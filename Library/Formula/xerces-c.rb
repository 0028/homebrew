require 'formula'

class XercesC < Formula
  homepage 'http://xerces.apache.org/xerces-c/'
  url 'http://www.apache.org/dyn/closer.cgi?path=xerces/c/3/sources/xerces-c-3.1.1.tar.gz'
  sha1 '177ec838c5119df57ec77eddec9a29f7e754c8b2'

  bottle do
    cellar :any
    sha1 "404bf51f70012e3f7ebd0162e2a9b8d211bcc94b" => :mavericks
    sha1 "75ab1590b72cf59ebdf59fb1e62b2c59315c354e" => :mountain_lion
    sha1 "b7a9db598dbab977bb300456423a2771d8ea5c9c" => :lion
  end

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
    # Remove a sample program that conflicts with libmemcached
    # on case-insensitive file systems
    (bin/"MemParse").unlink
  end
end
