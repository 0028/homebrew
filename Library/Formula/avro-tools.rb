require "formula"

class AvroTools < Formula
  homepage "http://avro.apache.org/"
  url "http://www.apache.org/dyn/closer.cgi?path=avro/avro-1.7.6/java/avro-tools-1.7.6.jar"
  sha1 "56ebab491e9dce5b1812c3867a8385cd636bb90a"

  bottle do
    cellar :any
    sha1 "9310b440b2ec54c265e8c6ca1cca836512119f90" => :mavericks
    sha1 "ccd145626fd8f3e8aa69fcca93d22742f2d8fcb8" => :mountain_lion
    sha1 "28784116ad12031536889ec5d24d4b36d4e5c920" => :lion
  end

  def install
    libexec.install "avro-tools-#{version}.jar"
    bin.write_jar_script libexec/"avro-tools-#{version}.jar", "avro-tools"
  end
end
