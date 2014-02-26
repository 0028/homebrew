require "formula"

class Vassh < Formula
  homepage "https://github.com/x-team/vassh"
  url "https://github.com/x-team/vassh/archive/0.2.tar.gz"
  sha1 "b7be90ab0a20f3edebe45dab2f7a048684871068"

  bottle do
    cellar :any
    sha1 "57e9af54feea9e2523418574d9d0b79f882c1be1" => :mavericks
    sha1 "df38ed71919537240eacc3b615b606f90e156c6d" => :mountain_lion
    sha1 "83415c8e9e0dc5cb0d5a08401e48f0c4fb035159" => :lion
  end

  def install
    bin.install "vassh.sh", "vasshin", "vassh"
  end

  test do
    system "#{bin}/vassh", "-h"
  end
end
