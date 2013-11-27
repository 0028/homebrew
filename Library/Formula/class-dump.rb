require 'formula'

class ClassDump < Formula
  homepage 'http://stevenygard.com/projects/class-dump/'
  head 'https://github.com/nygard/class-dump.git'
  url 'https://github.com/nygard/class-dump/archive/3.5.tar.gz'
  sha1 'c343bec63878161b02c956f49c9c1c8d989b4b5a'

  bottle do
    cellar :any
    sha1 'c47aca4978697481c23eb9dd480df6ef276f7c36' => :mavericks
  end

  depends_on :macos => :mavericks

  def install
    system "xcodebuild", "-configuration", "Release", "SYMROOT=build", "PREFIX=#{prefix}", "ONLY_ACTIVE_ARCH=YES"
    bin.install "build/Release/class-dump"
  end
end
