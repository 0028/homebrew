require 'formula'

class CssCrush < Formula
  homepage 'http://the-echoplex.net/csscrush'
  url 'https://github.com/peteboere/css-crush/archive/v2.0.0.tar.gz'
  sha1 '8f111e26971ce0adbe71ce850c56f39be825ca2b'

  bottle do
    sha1 'fe5367c02f067a6c3bb346533284d51194bf6b45' => :mavericks
    sha1 'f6dd64bf17497852caa8f7ad22e7bc8ac0e03c7f' => :mountain_lion
    sha1 'b854b1a787628ca2f5d957d8aa45417704d0ce1e' => :lion
  end

  def install
    libexec.install Dir['*']
    (bin+'csscrush').write <<-EOS.undent
      #!/bin/sh
      php "#{libexec}/cli.php" "$@"
    EOS
  end
end
