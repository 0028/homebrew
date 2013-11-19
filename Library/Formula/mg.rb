require 'formula'

class Mg < Formula
  homepage 'http://homepage.boetes.org/software/mg/'
  url 'http://homepage.boetes.org/software/mg/mg-20131118.tar.gz'
  sha1 '61f0d6ef2fd36acc51fa560aa67d4eccd3a6c2b9'

  bottle do
    cellar :any
    sha1 'cbd45dc3fa8853bb7414a34446dd2f4070bf099c' => :mavericks
    sha1 '825d150dcd4c7580c763d199ee8be9b018e90639' => :mountain_lion
    sha1 '7cc233d0ba2ebf9f93b854b34b585b263b7a88cc' => :lion
  end

  depends_on 'clens'

  def install
    system "make"
    bin.install "mg"
    doc.install "tutorial"
    man1.install "mg.1"
  end
end
