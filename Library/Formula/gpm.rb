require "formula"

class GoInstalled < Requirement
  fatal true
  default_formula "go"
  satisfy { which "go" }

  def message
    "Go is required to use gpm."
  end
end

class Gpm < Formula
  homepage "https://github.com/pote/gpm"
  url "https://github.com/pote/gpm/archive/v1.1.0.tar.gz"
  sha1 "feede16a13f50e762bd372a83aef6778c702726e"

  bottle do
    cellar :any
    sha1 "b8f4d8213745c562c812477650d032c96d85b79e" => :mavericks
    sha1 "ef34f6d892ede49da0232975c0ae67acb8fccf0c" => :mountain_lion
    sha1 "f2da7a11e4609d4e52282e7ffc432acc61494e26" => :lion
  end

  depends_on GoInstalled

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    Pathname("Godeps").write "github.com/pote/gpm-testing-package v6.1"

    ENV["GOPATH"] = testpath
    system "gpm", "install"

    Pathname("go_code.go").write <<-EOS.undent
      package main

      import (
              "fmt"
              "github.com/pote/gpm-testing-package"
      )

      func main() {
              fmt.Print(gpm_testing_package.Version())
      }
    EOS
    `go run go_code.go` == "v6.1"
  end
end
