require 'formula'

class RubyInstall < Formula
  homepage 'https://github.com/postmodern/ruby-install#readme'
  url 'https://github.com/postmodern/ruby-install/archive/v0.4.1.tar.gz'
  sha1 '8a62fa5e551101d433cf25bd67c06d47d00c3ab8'

  head 'https://github.com/postmodern/ruby-install.git'

  bottle do
    cellar :any
    sha1 "98a1c4be779f68aadf122b09ecd959e801d515ba" => :mavericks
    sha1 "f9e6d2d9bc2bb0eed351ab8b1770d93e02336548" => :mountain_lion
    sha1 "f6a9ad1bc65c7208975de72d6b9bde7906d2933c" => :lion
  end

  def install
    system 'make', 'install', "PREFIX=#{prefix}"
  end
end
