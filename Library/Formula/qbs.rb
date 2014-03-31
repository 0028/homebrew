require "formula"

class Qbs < Formula
  homepage "http://qt-project.org/wiki/qbs"
  url "http://download.qt-project.org/official_releases/qbs/1.1.2/qbs-1.1.2.src.tar.gz"
  sha1 "0350f2947f461bda33ee7e296d838004036f1e8e"
  bottle do
    cellar :any
    sha1 "c5e397bb144ea531d5b72f0ec2e66e4da1736508" => :mavericks
    sha1 "79fb176dd8aa1a04a9f5fe490be18f613610c1b5" => :mountain_lion
    sha1 "f78abe6bee3457e593450570fff902bb4239d45d" => :lion
  end

  depends_on "qt5"

  def install
    system "qmake", "qbs.pro", "-r"
    system "make", "install", "INSTALL_ROOT=#{prefix}"
  end

  test do
    system "qbs", "help"
  end
end
