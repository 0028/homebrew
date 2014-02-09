require 'formula'

class Psgrep < Formula
  homepage 'http://code.google.com/p/psgrep/'
  url 'http://psgrep.googlecode.com/files/psgrep-1.0.6.tar.bz2'
  sha1 'fe1102546971358a5eff2cff613d70ee63395444'

  head 'http://psgrep.googlecode.com/hg/'

  bottle do
    cellar :any
    sha1 "30b863360090ead98fe6936db34ab40f7cfdf2a9" => :mavericks
    sha1 "ff1575b19bf56cadd5c0f131643a0c2145d67238" => :mountain_lion
    sha1 "4f423c63f7dee7093fff7eb553dc9341126425c3" => :lion
  end

  def install
    bin.install "psgrep"
    man1.install "psgrep.1"
  end

  test do
    output = `#{bin}/psgrep #{Process.pid}`
    assert output.include?($0)
    assert_equal 0, $?.exitstatus
  end
end
