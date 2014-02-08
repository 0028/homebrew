require 'formula'

class CssCrush < Formula
  homepage 'http://the-echoplex.net/csscrush'
  url 'https://github.com/peteboere/css-crush/archive/v2.0.1.tar.gz'
  sha1 'dc91eda746938c0b876e47750177a70ccdb66568'

  bottle do
    sha1 "03442d1838cc422f88dc45454dcb021c5e709d31" => :mavericks
    sha1 "532840400ddd904df8159924b11146ca666061a1" => :mountain_lion
    sha1 "9c7abe7c811c7f8ff0f37b1f20d7af31489b7587" => :lion
  end

  def install
    libexec.install Dir['*']
    (bin+'csscrush').write <<-EOS.undent
      #!/bin/sh
      php "#{libexec}/cli.php" "$@"
    EOS
  end

  test do
    path = testpath/"test.crush"
    path.write <<-EOS.undent
      @define foo #123456;
      p { color: $(foo); }
    EOS

    output = `#{bin}/csscrush #{path}`.strip
    assert_equal "p{color:#123456}", output
    assert_equal 0, $?.exitstatus
  end
end
