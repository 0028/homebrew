require 'formula'

class S3cmd < Formula
  homepage 'http://s3tools.org/s3cmd'
  url 'https://github.com/s3tools/s3cmd/archive/v1.0.1.zip'
  sha1 '4a6f7bfb9300b728ca466967b91aa07521ef6f80'
  head 'https://github.com/s3tools/s3cmd.git'

  bottle do
    cellar :any
    sha1 "4cdd07df0d3424c363b5ad15790af1dccef87c43" => :mavericks
    sha1 "270a938642e250908f7688d0109df70b5f14a56b" => :mountain_lion
    sha1 "9e22264ac3c493452e38a3484085cb16ceb29965" => :lion
  end

  devel do
    url 'https://github.com/s3tools/s3cmd/archive/v1.5.0-beta1.zip'
    sha1 'ce5738c8d389b705b5a1283da6356df92673863b'
    version "1.5.0-beta1"
  end

  def install
    libexec.install 's3cmd', 'S3'
    man1.install 's3cmd.1'
    bin.install_symlink libexec+'s3cmd'
  end
end
