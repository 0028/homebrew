require "formula"

class Massren < Formula
  homepage "https://github.com/laurent22/massren"
  url "https://github.com/laurent22/massren/archive/v1.0.1.tar.gz"
  sha1 "0d8ee02fdf49fb42b0c5fe40c977ebdda5e4c3d9"

  bottle do
    sha1 "e46e2795f9d3a3dc9f643230c7fecf6d6ad187f3" => :mavericks
    sha1 "2ead133bddf83b65d9c9f3d9851fabe918a11a9f" => :mountain_lion
    sha1 "f0a562484f4c0e140f0b7f5bb80cbd5b6acea1fd" => :lion
  end

  depends_on 'go' => :build

  def install
    ENV['GOPATH'] = buildpath
    system 'go', 'get', 'github.com/jessevdk/go-flags'
    system 'go', 'get', 'github.com/kr/text'
    system 'go', 'get', 'github.com/laurent22/go-sqlkv'
    system 'go', 'get', 'github.com/mattn/go-sqlite3'
    system 'go', 'build', '-o', 'massren'
    bin.install 'massren'
  end
end
