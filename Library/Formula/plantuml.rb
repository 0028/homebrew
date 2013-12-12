require 'formula'

class Plantuml < Formula
  homepage 'http://plantuml.sourceforge.net/'
  url 'http://sourceforge.net/projects/plantuml/files/plantuml.7987.jar'
  sha1 '69beeb97a982b71fefd5ec5637de18b498910b13'

  bottle do
    sha1 '5161b1ee263aa769be3966ab65495ce107e69a95' => :mavericks
    sha1 '0ce84f3c3060a24822e82bb48ddbc8240e3e76cd' => :mountain_lion
    sha1 '6c9755e0926746e3b6b0e5f9d1fca3d9801dc64a' => :lion
  end

  depends_on 'graphviz'

  def install
    jar = "plantuml.#{version}.jar"
    prefix.install jar
    bin.write_jar_script prefix/jar, "plantuml"
  end

  test do
    system "#{bin}/plantuml", "-testdot"
  end
end
