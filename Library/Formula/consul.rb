require "formula"

# Consul has multiple components, but as a whole,
# it is a tool for discovering and configuring services in your infrastructure.

class Consul < Formula
  homepage "http://www.consul.io/"
  url "https://dl.bintray.com/mitchellh/consul/0.1.0_darwin_amd64.zip"
  sha1 "08dfd233011e6fe77928b6dd5d0221b5379250ce"
  version "0.1.0"

  bottle do
    cellar :any
    sha1 "a11eb6aeed0157e62e8c31d209c639a66834d316" => :mavericks
    sha1 "ec973893adb9a767268dc2846e9c00744d6dcdad" => :mountain_lion
    sha1 "3735216e97dad97edbd616665d66e8b8aad1dd07" => :lion
  end

  def install
    bin.install "consul"
  end
end
