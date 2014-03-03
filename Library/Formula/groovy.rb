require 'formula'

class Groovy < Formula
  homepage 'http://groovy.codehaus.org/'
  url 'http://dl.bintray.com/groovy/maven/groovy-binary-2.2.2.zip'
  sha1 'af74f5e08c089ac6baf4bca99eeb9df209340368'

  bottle do
    cellar :any
    sha1 "0b0ac9c3b8604886a5275e6ebc5df57cdb493388" => :mavericks
    sha1 "9552cc1a23244d0d42a9944ef53ed98f7b8b02f0" => :mountain_lion
    sha1 "d78a7510b8bae7f03453451100ba22730e50e4bb" => :lion
  end

  option 'invokedynamic', "Install the InvokeDynamic version of Groovy (only works with Java 1.7+)"

  def install
    # Don't need Windows files.
    rm_f Dir["bin/*.bat"]

    if build.include? 'invokedynamic'
      Dir['indy/*.jar'].each do |src_path|
        dst_file = File.basename(src_path, '-indy.jar') + '.jar'
        dst_path = File.join('lib', dst_file)
        mv src_path, dst_path
      end
    end

    prefix.install_metafiles
    libexec.install %w(bin conf lib embeddable)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<-EOS.undent
      You should set the environment variable GROOVY_HOME to
        #{opt_prefix}/libexec
    EOS
  end
end
