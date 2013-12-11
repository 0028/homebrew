require 'formula'

class Browsertime < Formula
  homepage 'http://browsertime.net'
  url 'https://github.com/tobli/browsertime/releases/download/browsertime-0.4/browsertime-0.4.zip'
  sha1 'b62d3b5eff94a0ab04c8359dfd36086f7573c8ac'

  bottle do
    cellar :any
    sha1 '281b1458fe8df85a88744032edd5bd7cef358da7' => :mavericks
    sha1 'a99504df8ddd93069cfed406f422f36894082627' => :mountain_lion
    sha1 'fad6dc7929eef43f02ac9e0546988e0503495cb0' => :lion
  end

  depends_on 'chromedriver'

  def install
    # Remove windows files
    rm_f Dir["bin/*.bat"]

    prefix.install_metafiles
    libexec.install Dir['*']
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "browsertime", "--version"
  end
end
