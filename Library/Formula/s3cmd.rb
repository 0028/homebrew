require 'formula'

class S3cmd < Formula
  homepage 'http://s3tools.org/s3cmd'
  url 'https://github.com/s3tools/s3cmd/archive/v1.0.1.tar.gz'
  sha1 '98ef9ea9e2dc56ab98f84610883d3d371c65e43a'
  head 'https://github.com/s3tools/s3cmd.git'

  devel do
    url 'https://github.com/s3tools/s3cmd/archive/v1.5.0-beta1.tar.gz'
    sha1 '3b5c299518cdfdd4adb81e843514865742082e82'
    version "1.5.0-beta1"
  end

  bottle do
    cellar :any
    revision 1
    sha1 "d88df0528690192723afb9059e5791da13ef9530" => :mavericks
    sha1 "338bd627976e26a3ccb4881118a238eeff05e3f3" => :mountain_lion
    sha1 "47b2632e5ca40c6f226bc655ce17c1a394e9780a" => :lion
  end

  def install
    libexec.install 's3cmd', 'S3'
    man1.install 's3cmd.1'
    bin.install_symlink libexec+'s3cmd'
  end
end
