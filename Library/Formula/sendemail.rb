require 'formula'

class Sendemail < Formula
  homepage 'http://caspian.dotconf.net/menu/Software/SendEmail/'
  url 'http://caspian.dotconf.net/menu/Software/SendEmail/sendEmail-v1.56.tar.gz'
  sha1 '5c7c03ce60785c7b7695ec486c84d6e15704df38'

  bottle do
    cellar :any
    sha1 'c7a2fb19f83cc9fc78536a2daee00ca35879417c' => :mavericks
    sha1 '128d25deecf64871e9823ea1c61516571eed0df5' => :mountain_lion
    sha1 '9c158bcec7396e8cd2495f56f3518901e932a593' => :lion
  end

  def patches
    { :p1 => "https://raw.github.com/mogaal/sendemail/e785a6d284884688322c9b39c0f64e20a43ea825/debian/patches/fix_ssl_version.patch" }
  end

  def install
    bin.install 'sendEmail'
  end

  test do
    assert_match /sendemail-#{Regexp.escape(version)}/, `#{bin}/sendemail`.strip
  end
end
