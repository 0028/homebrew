require 'formula'

class Afuse < Formula
  homepage 'https://github.com/pcarrier/afuse/'
  url 'https://afuse.googlecode.com/files/afuse-0.4.1.tar.gz'
  sha1 '156b196a27c181eee8b192e7922fbe3c32c858e3'

  bottle do
    cellar :any
    sha1 "0d623e29c611dbece02244914e5f5c3eb2df719d" => :mavericks
    sha1 "93da5f93f3449cbcd7ff6789d7ad27081275f43e" => :mountain_lion
    sha1 "59d0912c4bec0accc7d206dc0ca8b4d9cb23c8e6" => :lion
  end

  depends_on :autoconf
  depends_on :automake
  depends_on :libtool

  depends_on 'pkg-config' => :build
  depends_on 'osxfuse'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
