require 'formula'

class Mackup < Formula
  homepage 'https://github.com/lra/mackup'
  url 'https://github.com/lra/mackup/archive/0.5.9.tar.gz'
  sha1 '69d13c27b3a2794ddecb415333e783ca45aff055'

  head 'https://github.com/lra/mackup.git'

  bottle do
    cellar :any
    sha1 "04aabc98085183c1d9c31d2cca24f9ebb3ef71fc" => :mavericks
    sha1 "020fdf0d94506cd50108710a9b7c1605a7f3acee" => :mountain_lion
    sha1 "560359a511e0b577277c044902dc47adc6715f71" => :lion
  end

  depends_on :python

  def install
    bin.install 'bin/mackup'
    (prefix+'mackup').install 'mackup/__init__.py', 'mackup/main.py'
    share.install '.mackup.cfg' => 'mackup.cfg.example'
  end

  def test
    system "#{bin}/mackup", '-h'
  end
end
