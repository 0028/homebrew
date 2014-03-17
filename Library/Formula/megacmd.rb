require "formula"

class Megacmd < Formula
  homepage "https://github.com/t3rm1n4l/megacmd"
  url "https://github.com/t3rm1n4l/megacmd/archive/0.012.tar.gz"
  sha1 "30690366ef00b64296cd4acca6f842d83dcc9d69"
  head "https://github.com/t3rm1n4l/megacmd.git"

  bottle do
    sha1 "6cb766980f387f9960470f595ddb42b368fbe424" => :mavericks
    sha1 "27646a7816a9e13d4f612a2872b9ecaf1fb15ac7" => :mountain_lion
    sha1 "85e882065eaec11b3d8771b3f2499e078acfefb1" => :lion
  end

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    system "make"
    bin.install File.basename(buildpath) => "megacmd"
  end

  test do
    system "megacmd", "--version"
  end
end
