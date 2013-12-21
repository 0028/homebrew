require 'formula'

class RubyBuild < Formula
  homepage 'https://github.com/sstephenson/ruby-build'
  url 'https://github.com/sstephenson/ruby-build/archive/v20131220.1.tar.gz'
  sha1 '5fd4234ba74da0bf4762f97e66af52ec821e998f'

  head 'https://github.com/sstephenson/ruby-build.git'

  bottle do
    cellar :any
    sha1 'ce888b46e117e2cb91e5aa1d35a5b58f6031923a' => :mavericks
    sha1 'bd8c51a9d3373c20301a42482e96dbf1d8212a80' => :mountain_lion
    sha1 '9a1cce56a02f2630133e187a4093abc57ec583c6' => :lion
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
