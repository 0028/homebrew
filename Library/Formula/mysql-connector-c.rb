require 'formula'

class MysqlConnectorC < Formula
  homepage 'http://dev.mysql.com/downloads/connector/c/'
  url 'http://dev.mysql.com/get/Downloads/Connector-C/mysql-connector-c-6.1.3-src.tar.gz'
  sha1 'd70392aafb9ddeddd797c8131898e8727f904898'

  bottle do
    sha1 "2dc6ba478038f0137423b76562eacf08d8efbc22" => :mavericks
    sha1 "5a0b9d7dfff37994ea990c1a47d70649b2db114a" => :mountain_lion
    sha1 "2c0b454bb9dad447ea57a5d930ef6fdb4b0e150b" => :lion
  end

  depends_on 'cmake' => :build

  conflicts_with 'mysql', 'mariadb', 'percona-server',
    :because => 'both install MySQL client libraries'

  fails_with :llvm do
    build 2334
    cause "Unsupported inline asm"
  end

  def install
    system "cmake", ".", *std_cmake_args
    system 'make'
    ENV.j1
    system 'make install'
  end
end
