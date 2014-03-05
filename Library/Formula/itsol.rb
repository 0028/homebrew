require "formula"

class Itsol < Formula
  homepage "http://www-users.cs.umn.edu/~saad/software/ITSOL"
  url "http://www-users.cs.umn.edu/~saad/software/ITSOL/ITSOL_2.tar.gz"
  sha1 "c7af215aaa6ab377521ba317eccf6859165ebefb"

  bottle do
    sha1 "8b9a397a39cd1b77bfa67ab770d26d7c0cbce1bf" => :mavericks
    sha1 "0a5b4a33b2045079e4abfdd6632a62fac60d4b99" => :mountain_lion
    sha1 "4c7cf8d97271f61f7ce9b090097ef97d146e5325" => :lion
  end

  depends_on :fortran

  def install

    system "make"

    lib.install("LIB/libitsol.a")

    (include/"itsol").install Dir["INC/*.h"]

  end

end
