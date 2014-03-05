require 'formula'

class Griffon < Formula
  homepage 'http://griffon.codehaus.org/'
  url 'http://dl.bintray.com/content/aalmiray/Griffon/griffon-1.5.0-bin.tgz'
  sha1 'de28b792c37cf103b5745f2f323403ec6990c58a'

  bottle do
    cellar :any
    sha1 "1eb93e3f566a1c8efb41cdae3eaedff821773b7f" => :mavericks
    sha1 "ea6f7f294f39f8b92d2e60eb82a3f32e14148851" => :mountain_lion
    sha1 "f511e3e7057fa2c7983a599d0cad727a28d4b6f5" => :lion
  end

  def install
    rm_f Dir["bin/*.bat"]

    prefix.install_metafiles
    libexec.install Dir['*']
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats; <<-EOS.undent
    You should set the environment variable GRIFFON_HOME to:
      #{libexec}
    EOS
  end
end
