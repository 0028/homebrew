require 'formula'

class CssCrush < Formula
  homepage 'http://the-echoplex.net/csscrush'
  url 'https://github.com/peteboere/css-crush/archive/v2.1.0.tar.gz'
  sha1 '3285917dce69420e2822c59e5c25401aaaa5ea64'

  bottle do
    cellar :any
    sha1 "ecefcd1d35bfcc65fc7f177008a03be656f2bc62" => :mavericks
    sha1 "ed7b2ba6be69dc549d9d6e3e34c684ab01e86ab5" => :mountain_lion
    sha1 "5f2783a3e19ed3158192aa2c7c0742bb0394dcd0" => :lion
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
