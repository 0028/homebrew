require 'formula'

class Groovy < Formula
  homepage 'http://groovy.codehaus.org/'
  url 'http://dl.bintray.com/groovy/maven/groovy-binary-2.2.2.zip'
  sha1 'af74f5e08c089ac6baf4bca99eeb9df209340368'

  bottle do
    cellar :any
    sha1 "0c93ad1173049302b3ec033f493da9d250035c36" => :mavericks
    sha1 "868dd2425951ebcd18ee6a4f33aaeac04b85487c" => :mountain_lion
    sha1 "4cd21bb5a98b34d93821c25778578ab8d4f756b4" => :lion
  end

  option 'invokedynamic', "Install the InvokeDynamic version of Groovy (only works with Java 1.7+)"

  devel do
    url 'http://dl.bintray.com/groovy/maven/groovy-binary-2.3.0-beta-2.zip'
    sha1 '30c70cb68e3418c641c3b3ac8556aee5a1fe3f49'
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
