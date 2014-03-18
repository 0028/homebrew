require "formula"

class Tcat < Formula
  homepage "http://marcomorain.github.io/tcat/"
  url "https://github.com/marcomorain/tcat/archive/0.1.2.tar.gz"
  sha1 "faac576b32ddc99620fbe5f9fde7f01f5b4a4c28"

  bottle do
    cellar :any
    sha1 "e3dce8f779921ce69ace5532cb710713de466eb9" => :mavericks
    sha1 "4db8c67e163aa4c778946bbfb1011a5ce190d624" => :mountain_lion
    sha1 "0f4632994be934afab4755489b304858fc189725" => :lion
  end

  def install
    system "make"
    bin.install "tcat"
  end

  test do
    # The ouput of tcat should be parsable as a time
    # => "2014-03-18T12:52:50+0000 hello"
    # Split on whitespace to get the time section, and ensure that it can be
    # parsed as a time.
    Time.parse(`echo hello | tcat --format "%FT%T%z"`.split.first)
  end
end
