require 'formula'

class Gist < Formula
  homepage 'https://github.com/defunkt/gist'
  url 'https://github.com/defunkt/gist/archive/v4.1.3.tar.gz'
  sha1 '592afe5f45f476f2d9129bcd250892c884c3664d'
  head 'https://github.com/defunkt/gist.git'

  bottle do
    cellar :any
    sha1 '350a7c2203f53816c2d90bcfbb319ebd1bb6cbfd' => :mavericks
    sha1 '3d4887dc4cfd76cd82be745481140b576425fd32' => :mountain_lion
    sha1 '0a4048b65c4b32ab2fbc3bfa90535268df504fdb' => :lion
  end

  def install
    rake "install", "prefix=#{prefix}"
  end

  test do
    system "#{bin}/gist", '--version'
  end
end
