require 'formula'

class Groovy < Formula
  homepage 'http://groovy.codehaus.org/'
  url 'http://dl.bintray.com/groovy/maven/groovy-binary-2.2.2.zip'
  sha1 'af74f5e08c089ac6baf4bca99eeb9df209340368'

  bottle do
    cellar :any
    sha1 "0ccbb0e9263016327a9bff6de0ce8d41692e81ea" => :mavericks
    sha1 "2a8b9b8d7bec00b1817e5fe1c3f7056cabb61b37" => :mountain_lion
    sha1 "8c2e67335b1a83dff1406f0154868dca0fb68112" => :lion
  end

  option 'invokedynamic', "Install the InvokeDynamic version of Groovy (only works with Java 1.7+)"

  devel do
    url 'http://dl.bintray.com/groovy/maven/groovy-binary-2.3.0-beta-2.zip'
    sha1 '30c70cb68e3418c641c3b3ac8556aee5a1fe3f49'
    version '2.3.0-beta-2'
  end

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
        #{opt_libexec}
    EOS
  end
end
