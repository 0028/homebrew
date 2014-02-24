require 'formula'

class RubyBuild < Formula
  homepage 'https://github.com/sstephenson/ruby-build'
  url 'https://github.com/sstephenson/ruby-build/archive/v20140224.1.tar.gz'
  sha1 '482293b6afa524122538634f09366d27e82ff1c4'

  head 'https://github.com/sstephenson/ruby-build.git'

  bottle do
    cellar :any
    sha1 "32c2c2290f013c552951378f73236061363b691a" => :mavericks
    sha1 "ab09581097bbd709d254cc92080534ba07d146ad" => :mountain_lion
    sha1 "52c19a8fae7e4cc63d4fd5e2e4a88924b8b0817d" => :lion
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
