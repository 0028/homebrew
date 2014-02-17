require "formula"

class Nsq < Formula
  homepage "http://bitly.github.io/nsq"
  url "https://github.com/bitly/nsq/archive/v0.2.27.tar.gz"
  sha1 "3d8a1d28d76e3ea8e788192b0e9a39800b112791"

  bottle do
    sha1 "6b5127989337aff15f72b3eab727806e2b4c913f" => :mavericks
    sha1 "fe8accc1ff6eb9bb1e336cd90c444106393f384b" => :mountain_lion
    sha1 "9ed1b91c2cccf1c2a0afd5ec76081075479bb93e" => :lion
  end

  depends_on "go" => :build
  depends_on :hg # some package dependencies are mercurial repos

  resource "godep" do
    url "http://bitly-downloads.s3.amazonaws.com/nsq/godep.tar.gz"
    sha1 "396a62055bb5b4eb4f58cffc64b2ac8deafbacac"
  end

  def install
    # build a proper GOPATH tree for local dependencies
    (buildpath + "src/github.com/bitly/nsq").install "util", "nsqlookupd"
    (buildpath + "src/github.com/bitly/nsq/nsqadmin").install "nsqadmin/templates" => "templates"

    # godep is only needed to *build* so don't install somewhere permanent
    buildpath.install resource("godep")

    ENV["GOPATH"] = `#{buildpath}/godep path`.strip
    ENV.append_path "GOPATH", buildpath
    system "make"
    system "make", "DESTDIR=#{prefix}", "PREFIX=", "install"
  end

  test do
    system "#{bin}/nsqd", "--version"
  end
end
