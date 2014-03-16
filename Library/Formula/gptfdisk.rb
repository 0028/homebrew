require 'formula'

class Gptfdisk < Formula
  homepage 'http://www.rodsbooks.com/gdisk/'
  url 'https://downloads.sourceforge.net/project/gptfdisk/gptfdisk/0.8.10/gptfdisk-0.8.10.tar.gz'
  sha1 '1708e232220236b6bdf299b315e9bc2205c01ba5'

  bottle do
    cellar :any
    sha1 "78b2b0bf4c0f1e80e9ad89b13a6dfbbdc263b458" => :mavericks
    sha1 "01943676ce7a3f47e8904de6cea286d219d65281" => :mountain_lion
    sha1 "2636882005224db7aadfd58b564bbaaab990c0ad" => :lion
  end

  depends_on 'popt'
  depends_on 'icu4c'

  def install
    system "make -f Makefile.mac"
    sbin.install 'gdisk', 'cgdisk', 'sgdisk', 'fixparts'
    man8.install Dir['*.8']
  end

  test do
    IO.popen("#{sbin}/gdisk", "w+") do |pipe|
      pipe.write("\n")
      assert_match /GPT fdisk \(gdisk\) version #{Regexp.escape(version)}/, pipe.read
    end
  end
end
