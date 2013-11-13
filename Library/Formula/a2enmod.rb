require 'formula'

class A2enmod < Formula
  homepage 'https://github.com/rudisimo/a2enmod'
  url 'https://github.com/rudisimo/a2enmod/archive/v0.1.0.tar.gz'
  sha1 '4d0fa7509fc06e4fd9a015768ee1090a20580be2'

  head 'https://github.com/rudisimo/a2enmod.git'

  bottle do
    cellar :any
    sha1 '25e890d0b23e990c376927f11aeb94aa929fec7b' => :mavericks
    sha1 '9d6c2a34c581eda03729ac735ded05e2da7c3bcf' => :mountain_lion
    sha1 '943e104eca57038038d1e6ae290e9dd209ba012a' => :lion
  end

  def install
    ENV['PREFIX'] = prefix
    system "./install.sh"
  end
end
