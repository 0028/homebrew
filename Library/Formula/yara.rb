require 'formula'

class Yara < Formula
  homepage 'https://github.com/plusvic/yara/'
  url 'https://github.com/plusvic/yara/archive/2.1.0.tar.gz'
  sha1 '8289c281a44c933e11de25953f3910fe9f8ee82e'

  bottle do
    cellar :any
    sha1 "6c827febf5feca960cc6971f1b289062701c7d15" => :mavericks
    sha1 "ae455d96ee279bc1b94610f6bb9e6bab567f6433" => :mountain_lion
    sha1 "460735bd669c698bec49b793ce349f66d3462a32" => :lion
  end

  depends_on 'pcre'
  depends_on 'libtool' => :build
  depends_on 'autoconf' => :build
  depends_on 'automake' => :build

  def install
    # Use of 'inline' requires gnu89 semantics
    ENV.append 'CFLAGS', '-std=gnu89' if ENV.compiler == :clang

    # find Homebrew's libpcre
    ENV.append 'LDFLAGS', "-L#{Formula["pcre"].opt_lib} -lpcre"

    system "./bootstrap.sh"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
