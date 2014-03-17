require 'formula'

class Abcl < Formula
  homepage 'http://abcl.org'
  url 'http://abcl.org/releases/1.3.0/abcl-bin-1.3.0.tar.gz'
  sha1 '06704f96418b1a39ed0d774569c102af4c1606d8'

  bottle do
    cellar :any
    sha1 "ba42ab22c4d2a280ab997dadf3e93818bce9a865" => :mavericks
    sha1 "6b9d04d1f8d34d100b0a6b96064b065cff4352c3" => :mountain_lion
    sha1 "063ce6becab7c03f11c26ce5b65324f1c66843a2" => :lion
  end

  depends_on 'rlwrap'

  def install
    prefix.install "abcl.jar", "abcl-contrib.jar"
    (bin+"abcl").write <<-EOS.undent
      #!/bin/sh
      rlwrap java -jar "#{prefix}/abcl.jar" "$@"
    EOS
  end
end
