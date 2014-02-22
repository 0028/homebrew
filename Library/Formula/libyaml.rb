require 'formula'

class Libyaml < Formula
  homepage 'http://pyyaml.org/wiki/LibYAML'
  url 'http://pyyaml.org/download/libyaml/yaml-0.1.5.tar.gz'
  sha1 '8b78cb9f759c7d80db8a7328c0ebecfe34fde737'

  bottle do
    cellar :any
    sha1 "f0dcf4e7b9884240f292ba2516fd96531f191313" => :mavericks
    sha1 "d71eac348ddb22ddca59efcecbc440ebc9ba3ef4" => :mountain_lion
    sha1 "4b4644eca18c2ee25b63c04fd194460b423e0f67" => :lion
  end

  option :universal

  def install
    ENV.universal_binary if build.universal?

    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
