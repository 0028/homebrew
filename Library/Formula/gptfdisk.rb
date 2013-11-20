require 'formula'

class Gptfdisk < Formula
  homepage 'http://www.rodsbooks.com/gdisk/'
  url 'http://downloads.sourceforge.net/project/gptfdisk/gptfdisk/0.8.8/gptfdisk-0.8.8.tar.gz'
  sha1 '11f66ec2a67920368f7afe0c01a1cb8c3f2c527a'

  bottle do
    cellar :any
    sha1 '50f9ad9a43e6e1dec408490a1deed1f55a78ccaf' => :mavericks
    sha1 'b15c857475cbc913c869ce5ff0c8493ddfa15859' => :mountain_lion
    sha1 '538641bdeb226bfa66b1d7151e1ed4fcaeb54c37' => :lion
  end

  depends_on 'popt'
  depends_on 'icu4c'

  def install
    system "make -f Makefile.mac"
    sbin.install ['gdisk','cgdisk','sgdisk','fixparts']
    man8.install ['gdisk.8','cgdisk.8','sgdisk.8','fixparts.8']
  end

  test do
    IO.popen("#{sbin}/gdisk", "w+") do |pipe|
      pipe.write("\n")
      assert_match /GPT fdisk \(gdisk\) version #{Regexp.escape(version)}/, pipe.read
    end
  end
end
