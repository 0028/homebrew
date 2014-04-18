require 'formula'

class RubyInstall < Formula
  homepage 'https://github.com/postmodern/ruby-install#readme'
  url 'https://github.com/postmodern/ruby-install/archive/v0.4.2.tar.gz'
  sha1 'f5cb5be73f29a943b291e16926bb71af440eefb7'

  head 'https://github.com/postmodern/ruby-install.git'

  bottle do
    cellar :any
    sha1 "37e8238134cd768d280228a39bf5da3b3c293f7a" => :mavericks
    sha1 "13f3e92ccf9563d5628686bead08a739699baa37" => :mountain_lion
    sha1 "4e6492a60cbc67a3a648e2f918b9d6177da3cccc" => :lion
  end

  def install
    system 'make', 'install', "PREFIX=#{prefix}"
  end
end
