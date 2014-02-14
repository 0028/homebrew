require 'formula'

class RubyInstall < Formula
  homepage 'https://github.com/postmodern/ruby-install#readme'
  url 'https://github.com/postmodern/ruby-install/archive/v0.4.0.tar.gz'
  sha1 'b5d3e202abd90c748d56e14bf50e99c5e97d2ef3'

  head 'https://github.com/postmodern/ruby-install.git'

  bottle do
    cellar :any
    sha1 "7735c432cb4b7f5092e1b9d82b1d87ac2f2e49db" => :mavericks
    sha1 "646e3ebb32537601a11925e9a55adc1121c677cf" => :mountain_lion
    sha1 "878ca85096834a80f897e5137b76d8b3613c9d36" => :lion
  end

  def install
    system 'make', 'install', "PREFIX=#{prefix}"
  end
end
