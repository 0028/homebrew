require "formula"

class Ruby19Dependency < Requirement
  fatal true

  satisfy do
    `ruby --version` =~ /ruby (\d\.\d).\d/
    $1.to_f >= 1.9
  end

  def message
    "Selecta requires Ruby 1.9 or better."
  end
end

class Selecta < Formula
  homepage "https://github.com/garybernhardt/selecta"
  url "https://github.com/garybernhardt/selecta/archive/v0.0.3.tar.gz"
  sha1 "0530f2145d5eb018ba9cf7108bd78d3e5bb03434"

  bottle do
    cellar :any
    sha1 "1166931632a03f81b3db7477a5cd775246273cbe" => :mavericks
  end

  depends_on Ruby19Dependency

  def install
    bin.install "selecta"
  end

  test do
    system "#{bin}/selecta", "--version"
  end
end
