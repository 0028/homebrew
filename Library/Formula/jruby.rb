require 'formula'

class Jruby < Formula
  homepage 'http://www.jruby.org'
  url 'http://jruby.org.s3.amazonaws.com/downloads/1.7.10/jruby-bin-1.7.10.tar.gz'
  sha1 '5ec267dd3ddaa6e27801692a7080204067662289'

  bottle do
    cellar :any
    sha1 '72f9735add7404f00e070c62cea6bdc83fa1c978' => :mavericks
    sha1 'c8f11c6deea980e15368c88d8e354f307a5648bf' => :mountain_lion
    sha1 'bf9ecceaba588b3951d3ebc9d22ac62a9bf1c7e6' => :lion
  end

  def install
    # Remove Windows files
    rm Dir['bin/*.{bat,dll,exe}']

    # Prefix a 'j' on some commands
    cd 'bin' do
      Dir['*'].each do |file|
        mv file, "j#{file}" unless file.match /^[j]/
      end
    end

    # Only keep the OS X native libraries
    cd 'lib/jni' do
      Dir['*'].each do |file|
        rm_rf file unless file.downcase == 'darwin'
      end
    end

    libexec.install Dir['*']
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def test
    system "#{bin}/jruby", "-e", "puts 'hello'"
  end
end
