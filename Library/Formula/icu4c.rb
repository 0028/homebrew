require 'formula'

class Icu4c < Formula
  homepage 'http://site.icu-project.org/'
  url 'http://download.icu-project.org/files/icu4c/53.1/icu4c-53_1-src.tgz'
  version '53.1'
  sha1 '7eca017fdd101e676d425caaf28ef862d3655e0f'
  head 'http://source.icu-project.org/repos/icu/icu/trunk/', :using => :svn

  bottle do
    sha1 "de7a57ad2e87343acc6aab66d5f53731327c288a" => :mavericks
    sha1 "9e8fa0118835aa269638a234489d1cade33197db" => :mountain_lion
    sha1 "f59a19a94d9802afe31e908e44541f07d8001a13" => :lion
  end

  keg_only "Conflicts; see: https://github.com/Homebrew/homebrew/issues/issue/167"

  option :universal
  option :cxx11

  def install
    ENV.universal_binary if build.universal?
    ENV.cxx11 if build.cxx11?

    args = ["--prefix=#{prefix}", "--disable-samples", "--disable-tests", "--enable-static"]
    args << "--with-library-bits=64" if MacOS.prefer_64_bit?
    cd "source" do
      system "./configure", *args
      system "make", "VERBOSE=1"
      system "make", "VERBOSE=1", "install"
    end
  end
end
