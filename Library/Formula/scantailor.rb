require 'formula'

class Scantailor < Formula
  class Version < ::Version
    def enhanced?
      to_a[0].to_s == "enhanced"
    end

    def <=>(other)
      other = self.class.new(other)
      if enhanced? && other.enhanced?
        super
      elsif enhanced?
        1
      elsif other.enhanced?
        -1
      else
        super
      end
    end
  end

  homepage 'http://scantailor.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/scantailor/scantailor/0.9.11.1/scantailor-0.9.11.1.tar.gz'
  bottle do
    sha1 "8aea44981eccf664203780f4beb865aa52e66ae0" => :mavericks
    sha1 "e27d8a0c2c2b255c51d9c90273dfb2c8adb1e608" => :mountain_lion
    sha1 "6d049e43c2e7c3e1e55b788140c70410ddf497d7" => :lion
  end

  version '0.9.11.1' => Version
  sha1 '80970bbcd65fbf8bc62c0ff0cb7bcb78c86961c3'

  devel do
    url 'https://downloads.sourceforge.net/project/scantailor/scantailor-devel/enhanced/scantailor-enhanced-20140214.tar.bz2'
    version 'enhanced-20140214' => Version
    sha1 'e90b861f02a571184b8ab9d5ef59dd57dcf1c212'
  end

  depends_on 'cmake' => :build
  depends_on 'qt'
  depends_on 'boost'
  depends_on 'jpeg'
  depends_on 'libtiff'
  depends_on :x11

  def patches
    # makes Scan Tailor work with Clang on OS X Mavericks
    "https://gist.github.com/muellermartin/8569243/raw/b09215037b346787e0f501ae60966002fd79602e/scantailor-0.9.11.1-clang.patch"
  end

  def install
    system "cmake", ".", "-DPNG_INCLUDE_DIR=#{MacOS::X11.include}", *std_cmake_args
    system "make install"
  end
end
