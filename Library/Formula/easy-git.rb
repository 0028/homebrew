require 'formula'

class EasyGit < Formula
  homepage 'http://people.gnome.org/~newren/eg/'
  url 'http://people.gnome.org/~newren/eg/download/1.7.5.2/eg', :using => :ssl3
  sha256 '59bb4f8b267261ab3d48c66b957af851d1a61126589173ebcc20ba9f43c382fb'
  version '1.7.5.2'

  bottle do
    cellar :any
    sha1 'da4c3865673ebc5c232d0bfc8cca1f284d0f92d4' => :mavericks
    sha1 '7b66d43ac58d152928e424e8c23cabafa02e24c7' => :mountain_lion
    sha1 '6b899c5dd034d073ee9fb4bc54081db73f4d19b1' => :lion
  end

  def install
    bin.install "eg"
  end

  test do
    system "#{bin}/eg", "help"
  end
end
