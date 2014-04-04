require 'formula'

class Storm < Formula
  homepage 'https://storm.incubator.apache.org'
  url 'http://mirror.csclub.uwaterloo.ca/apache/incubator/storm/apache-storm-0.9.1-incubating/apache-storm-0.9.1-incubating.zip'
  version '0.9.1'
  sha1 '75f28e07fae2d21e427ba998b93069ef7dd3e184'
  head 'https://github.com/apache/incubator-storm.git'

  bottle do
    cellar :any
    sha1 "54b3661cf4ed9fc3e7807555d6ca23e435d630ea" => :mavericks
    sha1 "0f62e06490de2ad71542c1f639eaa4725a8d5040" => :mountain_lion
    sha1 "3588458ae4a821709f6a190f71e9ff37053e1a14" => :lion
  end

  def install
    libexec.install Dir['*']
    bin.install_symlink libexec/"bin/storm"
  end
end
