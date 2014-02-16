require 'formula'

class AvroC < Formula
  homepage 'http://avro.apache.org/'
  url 'http://www.apache.org/dyn/closer.cgi?path=avro/avro-1.7.6/c/avro-c-1.7.6.tar.gz'
  sha1 '890fb6e2fd5c12018e47b8fff49900a361a44a17'

  bottle do
    cellar :any
    sha1 "692de30aefe697db5f5db1c7a4d06c53b91a2a23" => :mavericks
    sha1 "f114ffd32595d6eb0f1f46cf9dbed321c133b74f" => :mountain_lion
    sha1 "ed4f9a6923d97a61064081a74b8f21433a1121fd" => :lion
  end

  # probably should be an optional dep
  conflicts_with 'xz'

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end
end
