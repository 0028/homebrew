require 'formula'

class MysqlConnectorCxx < Formula
  homepage 'http://dev.mysql.com/downloads/connector/cpp/'
  url 'http://mysql.he.net/Downloads/Connector-C++/mysql-connector-c++-1.1.3.tar.gz'
  sha1 'b817dccf3a4e340b6a972028ceb7eededaaebd6f'

  bottle do
    cellar :any
    sha1 "0bc8f29a9a095d8f39b8a6179474c598fc2a1a3d" => :mavericks
    sha1 "e727869f542bfb8ff8c97cd486f53b4a2d83b068" => :mountain_lion
    sha1 "519947a5d532c6cccc3a9d0a66a7380bea5ff0ff" => :lion
  end

  depends_on 'cmake' => :build
  depends_on 'boost' => :build
  depends_on 'mysql'

  def install
    system "cmake", ".", *std_cmake_args
    ENV.j1
    system "make install"
  end
end
