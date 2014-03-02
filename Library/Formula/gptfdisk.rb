require 'formula'

class Gptfdisk < Formula
  homepage 'http://www.rodsbooks.com/gdisk/'
  url 'https://downloads.sourceforge.net/project/gptfdisk/gptfdisk/0.8.8/gptfdisk-0.8.8.tar.gz'
  sha1 '11f66ec2a67920368f7afe0c01a1cb8c3f2c527a'

  bottle do
    cellar :any
    sha1 "7fd38a94d19b350ea574f70f8bcc61503f3c7830" => :mavericks
    sha1 "928cf2cb00f796c480605594e5bf8752ea708eff" => :mountain_lion
    sha1 "57a8810f943d7a42c6a71217a77dc9412f57bab9" => :lion
  end

  depends_on 'popt'
  depends_on 'icu4c'

  def install
    system "make -f Makefile.mac"
    sbin.install 'gdisk', 'cgdisk', 'sgdisk', 'fixparts'
    man8.install Dir['*.8']
  end

  test do
    assert_match /GPT fdisk \(gdisk\) version #{Regexp.escape(version)}/,
                 pipe("#{sbin}/gdisk", "\n")
  end
end
