require 'formula'

class RubyBuild < Formula
  homepage 'https://github.com/sstephenson/ruby-build'
  url 'https://github.com/sstephenson/ruby-build/archive/v20131225.1.tar.gz'
  sha1 '97e5a335b38a5068823494ba2f8776ec1b386947'

  head 'https://github.com/sstephenson/ruby-build.git'

  bottle do
    cellar :any
    sha1 'f56a80652596e55aeefbe0b2a54217336f19b921' => :mavericks
    sha1 'bb5e51853b0d574d933da2b075f435783256746d' => :mountain_lion
    sha1 '3a59c789b879c11b5b1d6f4cdfceb7876b9b6b17' => :lion
  end

  depends_on 'autoconf' => [:recommended, :run]
  depends_on 'pkg-config' => [:recommended, :run]
  depends_on 'openssl' => :recommended

  def install
    ENV['PREFIX'] = prefix
    system "./install.sh"
  end

  test do
    system "#{bin}/ruby-build --version | grep #{version}"
  end
end
