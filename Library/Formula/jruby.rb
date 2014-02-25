require 'formula'

class Jruby < Formula
  homepage 'http://www.jruby.org'
  url 'http://jruby.org.s3.amazonaws.com/downloads/1.7.11/jruby-bin-1.7.11.tar.gz'
  sha1 '1bec9fa355603b11ac9a1caa2aec790b06de7e5f'

  bottle do
    cellar :any
    sha1 "420c186094450fd6485d5fdc160445389d80b4a5" => :mavericks
    sha1 "633f83fc5ab428f07d05835ed608ce15a36c825a" => :mountain_lion
    sha1 "abfffe1c5adace436c7625354a01a3a50ad450ae" => :lion
  end

  def install
    # Remove Windows files
    rm Dir['bin/*.{bat,dll,exe}']

    cd 'bin' do
      # Prefix a 'j' on some commands to avoid clashing with other ruby installations
      ['ast', 'rake', 'rdoc', 'ri', 'testrb'].each { |f| mv f, "j#{f}" }
      # Delete some unnecessary command
      #  gem is a wrapper script for jgem
      #  irb is an identical copy of jirb
      ['gem', 'irb'].each { |f| rm f }
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

  test do
    system "#{bin}/jruby", "-e", "puts 'hello'"
  end
end
