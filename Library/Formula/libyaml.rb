require 'formula'

class Libyaml < Formula
  homepage 'https://bitbucket.org/xi/libyaml'
  url 'https://bitbucket.org/xi/libyaml/get/0.1.5.tar.gz'
  sha1 '060fdcfbab2bf2fb8b47a3b17e1f05ef2b8ad9e2'

  bottle do
    cellar :any
    sha1 "54d63ae6a8ecf24011fa6b8569aaecf3e3795676" => :mavericks
    sha1 "011bfc4d325bce200ed8dce388d51b3cdd64c429" => :mountain_lion
    sha1 "11801740a6a4c7c07dcb24bf81b29b5bdb75ca30" => :lion
  end

  option :universal

  depends_on :autoconf
  depends_on :automake
  depends_on :libtool

  def install
    ENV.universal_binary if build.universal?

    system "./bootstrap"
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
