require 'formula'

class Akka < Formula
  homepage 'http://akka.io/'
  url 'http://downloads.typesafe.com/akka/akka-2.3.0.tgz'
  sha1 '4a5968ab3510d0ac22d30feab38d59cbe73a9203'

  def install
    # Remove Windows files
    rm "bin/akka.bat"

    # Translate akka script
    inreplace "bin/akka" do |s|
      s.gsub! /^declare AKKA_HOME=.*$/, "declare AKKA_HOME=#{libexec}"
    end

    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/akka"
  end
end
