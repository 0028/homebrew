require 'formula'

class IosSim < Formula
  homepage 'https://github.com/phonegap/ios-sim'
  url 'https://github.com/phonegap/ios-sim/archive/1.9.0.tar.gz'
  sha1 '2ec400711e7a9d33eb5f08c577b47ead1fcdb9cb'
  head 'https://github.com/phonegap/ios-sim.git'

  bottle do
    cellar :any
    sha1 "15be06925a9895fa110184893e90c6eda41fd627" => :mavericks
    sha1 "eaaa4797f2ac182d5add3af6f6458cb5bd5e977e" => :mountain_lion
    sha1 "af382708f5ac8ed79ce5c37353e8363e45020af1" => :lion
  end

  depends_on :macos => :lion

  def install
    rake "install", "prefix=#{prefix}"
  end
end
