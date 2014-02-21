require "formula"

class ChromeCli < Formula
  homepage "https://github.com/prasmussen/chrome-cli"
  url "https://github.com/prasmussen/chrome-cli/archive/1.4.1.zip"
  sha1 "9f44fd5def7f3662b83b90669d95f863722c06eb"

  head "https://github.com/prasmussen/chrome-cli.git"

  bottle do
    cellar :any
    sha1 "8776c7c4b2ff336ae8ff700a2752ba12d8c34910" => :mavericks
    sha1 "46a67026c24bc43e7395f0db3f826e529c911836" => :mountain_lion
  end

  depends_on :xcode
  depends_on :macos => :mountain_lion # strange error with lion

  def install
    system 'xcodebuild', 'SDKROOT=', 'SYMROOT=build'
    bin.install 'build/Release/chrome-cli'
  end

  test do
    system "#{bin}/chrome-cli", 'version'
  end
end
