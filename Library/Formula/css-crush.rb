require 'formula'

class CssCrush < Formula
  homepage 'http://the-echoplex.net/csscrush'
  url 'https://github.com/peteboere/css-crush/archive/v2.0.1.tar.gz'
  sha1 'dc91eda746938c0b876e47750177a70ccdb66568'

  bottle do
    sha1 '676c4ee0a6494029fc4a4772bf4ec86d1891d635' => :mavericks
    sha1 '371a9080e24fc84f0ebc3a480b17fbc4c7ada5b6' => :mountain_lion
    sha1 'd1b57dffb4e8854269323f4ddef1d7118517a5d1' => :lion
  end

  def install
    libexec.install Dir['*']
    (bin+'csscrush').write <<-EOS.undent
      #!/bin/sh
      php "#{libexec}/cli.php" "$@"
    EOS
  end
end
