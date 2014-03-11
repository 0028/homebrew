require 'formula'

class Nanomsg < Formula
  homepage 'http://nanomsg.org'
  url 'http://download.nanomsg.org/nanomsg-0.3-beta.tar.gz'
  sha1 '3ca5a9655a96bb3194648b0ab7530d15e0afdbae'

  bottle do
    cellar :any
    sha1 "e66cd0d7db79813295e827fd010bb111893e0ef4" => :mavericks
    sha1 "d8bf6a9ea752da61712a082c65f72e17eb3af3d9" => :mountain_lion
    sha1 "6cb11ac2dbfc40788190013b55f48eaee8008486" => :lion
  end

  head do
    url 'https://github.com/nanomsg/nanomsg.git'

    depends_on :autoconf
    depends_on :automake
  end

  option 'with-test', 'Verify the build with make check'
  option 'with-doc', 'Install man pages'
  option 'without-nanocat', 'Do not install nanocat tool'
  option 'with-debug', 'Compile with debug symbols'

  depends_on 'pkg-config'=> :build
  depends_on :libtool

  if build.with? 'doc'
    depends_on 'asciidoc' => :build
    depends_on 'xmlto' => :build
  end

  def install
    ENV['XML_CATALOG_FILES'] = "#{etc}/xml/catalog" if build.with? 'doc'

    system './autogen.sh' if build.head?

    args = ["--disable-dependency-tracking",
            "--disable-silent-rules",
            "--prefix=#{prefix}"]
    args << "--disable-nanocat" if build.without? 'nanocat'
    args << "--enable-debug" if build.with? 'debug'
    args << "--enable-doc" if build.with? 'doc'

    system './configure', *args
    system 'make'
    system 'make', '-j1', 'check' if build.with? 'test'
    system 'make', 'install'
  end
end
