require 'formula'

class Libcppa < Formula
  homepage 'http://libcppa.blogspot.it'
  url 'http://github.com/Neverlord/libcppa/archive/V0.8.1.tar.gz'
  sha1 'd4f096aae2bb72e254ad6df45edf3fb62370acaa'

  bottle do
    cellar :any
    sha1 "6a100dc620b046f8790a492467020b6d64cc6d12" => :mavericks
    sha1 "f6bc519f92c6b69e7a4e5cdae9e5de8a5cdb4fde" => :mountain_lion
    sha1 "78c2eee261ef013458914f22a272ebee2cccda35" => :lion
  end

  depends_on :macos => :lion
  depends_on 'cmake' => :build

  option 'with-opencl', 'Build with OpenCL actors'
  option 'with-examples', 'Build examples'

  fails_with :gcc do
    cause 'libcppa requires a C++11 compliant compiler.'
  end

  fails_with :llvm do
    cause 'libcppa requires a C++11 compliant compiler.'
  end

  def install
    args = %W[
      --prefix=#{prefix}
      --build-static
      --disable-context-switching
    ]

    args << '--with-opencl' if build.with? 'opencl'
    args << '--no-examples' unless build.with? 'examples'

    system "./configure", *args
    system "make"
    system "make", "test"
    system "make", "install"
  end
end
