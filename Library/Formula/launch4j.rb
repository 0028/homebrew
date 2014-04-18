require 'formula'

class Launch4j < Formula
  homepage 'http://launch4j.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/launch4j/launch4j-3/3.3/launch4j-3.3-macosx-x86-10.8.tgz'
  sha1 '512e424d9e3eb697d70fda02ca6a204e246838b2'
  version '3.3'

  bottle do
    cellar :any
    sha1 "85433c84ac51450b5ba66857597d21538c491327" => :mavericks
    sha1 "a5732d8728ba7da87b0f223d4e805ee4955943f0" => :mountain_lion
    sha1 "f411dbc1cd1368a4f2289dff341a1fd5bb44cf4c" => :lion
  end

  def install
    libexec.install Dir['*'] - ['src', 'web']
    bin.write_jar_script libexec/"launch4j.jar", "launch4j"
  end
end
