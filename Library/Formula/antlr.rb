require 'formula'

class Antlr < Formula
  homepage 'http://www.antlr.org/'
  url 'http://www.antlr.org/download/antlr-4.2-complete.jar'
  sha1 '2ca46f6c3fee3cde543ec21a800805e9432acab7'

  bottle do
    sha1 "6656ddaa4b1af7e73dd77610bc3b1a19bfb511ac" => :mavericks
    sha1 "6a82af8b3f18ba86a58b9d5da636648659fec779" => :mountain_lion
    sha1 "a8c84b631af9787eda1007e5d90e8701be30b277" => :lion
  end

  def install
    prefix.install "antlr-#{version}-complete.jar"
    bin.write_jar_script prefix/"antlr-#{version}-complete.jar", "antlr4"
  end
end
