require "formula"

class Grenchman < Formula
  homepage "http://leiningen.org/grench.html"
  url "https://grenchman.s3.amazonaws.com/downloads/grench-0.2.0-mac"
  sha1 "a1468c2e31deeeaf9925c6a3d1ebf9b3aac96521"

  bottle do
    cellar :any
    sha1 "761c7423c51c4a4ce21cc5770bce7304147cfe4f" => :mavericks
    sha1 "26f5fb25677ad891dd044542c451b5a50dc2e9ef" => :mountain_lion
    sha1 "76480988b5a950b6dd03884b51621478ba22dc7d" => :lion
  end

  def install
    bin.install 'grench-0.2.0-mac' => 'grench'
  end

end
