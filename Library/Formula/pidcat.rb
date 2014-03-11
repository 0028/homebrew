require 'formula'

class Pidcat < Formula
  homepage 'https://github.com/JakeWharton/pidcat'
  url 'https://github.com/JakeWharton/pidcat/archive/1.4.1.tar.gz'
  sha1 '89f806ae1fa3375ce188851c8c95fc1097467b82'
  head 'https://github.com/JakeWharton/pidcat.git'

  bottle do
    cellar :any
    sha1 "c135280b01b1f77e1f498bf9ec04f32949a36094" => :mavericks
    sha1 "737ed0639b907d221b9b7fcae2ea5fe94a005993" => :mountain_lion
    sha1 "81da34be71cca2ff80168017cca19b1596321d3a" => :lion
  end

  def install
    bin.install 'pidcat.py' => 'pidcat'
  end

  test do
    output = `#{bin}/pidcat --help`.strip
    assert_match /^usage: pidcat/, output
  end
end
