require "formula"

class NanopbGenerator < Formula
  homepage "http://koti.kapsi.fi/jpa/nanopb/docs/index.html"
  url "http://koti.kapsi.fi/~jpa/nanopb/download/nanopb-0.2.7.tar.gz"
  sha1 "7dce0b9e1f9e5d0614697a8ea1678cee76f14858"

  bottle do
    cellar :any
    sha1 "f8ae28d4a4089f84a5611137d2e1a26612a5c747" => :mavericks
    sha1 "f8aa6297c03ff5c2ddbaabec2886b9af3783c472" => :mountain_lion
    sha1 "5b9c83f85c7e9d89ffe028e18a241b67a5fc8df2" => :lion
  end

  depends_on :python
  depends_on "protobuf"

  resource "protobuf-python" do
    url "https://pypi.python.org/packages/source/p/protobuf/protobuf-2.5.0.tar.gz"
    sha1 "1a6028d113484089edbde95900b6d9467160cc41"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec+"lib/python2.7/site-packages"
    resource("protobuf-python").stage do
      system "python", "setup.py", "install", "--prefix=#{libexec}"
    end

    Dir.chdir "generator"

    Dir.chdir "proto" do
      system "make"
    end

    libexec.install ["nanopb_generator.py", "protoc-gen-nanopb", "proto"]

    (bin/"protoc-gen-nanopb").write_env_script libexec/"protoc-gen-nanopb", :PYTHONPATH => ENV["PYTHONPATH"]
    (bin/"nanopb_generator.py").write_env_script libexec/"nanopb_generator.py", :PYTHONPATH => ENV["PYTHONPATH"]
  end

  test do
    (testpath/"test.proto").write <<-PROTO.undent
      message Test {
        required string test_field = 1;
      }
    PROTO
    system "protoc", "--nanopb_out=.", "test.proto"
    system "grep", "test_field", "test.pb.c"
    system "grep", "test_field", "test.pb.h"
  end
end
