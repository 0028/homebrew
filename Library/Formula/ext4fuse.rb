require 'formula'

class Ext4fuse < Formula
  homepage 'https://github.com/gerard/ext4fuse'
  url 'https://github.com/gerard/ext4fuse/archive/v0.1.3.tar.gz'
  sha1 '87d436581fea73273d83779021a7a3c0158d7c41'

  head 'https://github.com/gerard/ext4fuse.git'

  bottle do
    cellar :any
    sha1 "84054034a0b629c01cd945004e3cbbb4a4520088" => :mavericks
    sha1 "ffbad70589f5421be0225ec52bf2f8b3feb205a6" => :mountain_lion
    sha1 "0e7d9f556094dcd7172e2e764814539e7580d52d" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'osxfuse'

  def install
    system 'make'
    bin.install 'ext4fuse'
  end
end
