require 'formula'

class MysqlConnectorCxx < Formula
  homepage 'http://dev.mysql.com/downloads/connector/cpp/'
  url 'http://mysql.he.net/Downloads/Connector-C++/mysql-connector-c++-1.1.3.tar.gz'
  sha1 'b817dccf3a4e340b6a972028ceb7eededaaebd6f'

  bottle do
    cellar :any
    sha1 "7b0006f667454c533ca71ac7f31e328000fe1b1f" => :mavericks
    sha1 "7787d0ad5c9d1a4df086ea0462a8e0d0648404ff" => :mountain_lion
    sha1 "a1c5f6fe5bc18890e5ed8c0cb8bb57b174f86105" => :lion
  end

  class MysqlClient < Requirement
    fatal true
    default_formula "mysql"

    satisfy { which 'mysql' }
  end

  depends_on 'cmake' => :build
  depends_on 'boost' => :build
  depends_on MysqlClient

  def install
    system "cmake", ".", *std_cmake_args
    ENV.j1
    system "make install"
  end
end
