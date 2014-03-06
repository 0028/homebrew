require 'formula'

class Akka < Formula
  homepage 'http://akka.io/'
  url 'http://downloads.typesafe.com/akka/akka-2.3.0.tgz'
  sha1 'f2128ce170bb4f61b0e981f5611b85207938e460'

  bottle do
    sha1 "f3d27d475eb6d7c6a02eedf5eb171fadecd4e41e" => :mavericks
    sha1 "ed8aa779c40d094bb87c7d3e7fe93583c281be82" => :mountain_lion
    sha1 "ed936e095022456a4ff7bf95ab0e163164360495" => :lion
  end

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
