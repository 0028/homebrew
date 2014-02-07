require 'formula'

class EyeD3 < Formula
  homepage 'http://eyed3.nicfit.net/'
  url 'http://eyed3.nicfit.net/releases/eyeD3-0.6.18.tar.gz'
  sha1 'd8887f7b75306bd293e0b0d46a977e73225ae7b5'

  bottle do
    cellar :any
    sha1 "7b1dcbf7a9283cce2847e252b7a3df5f53ab98b5" => :mavericks
    sha1 "ce4a386f3132306900f6bea9445b8289c5d7b423" => :mountain_lion
    sha1 "a97cb6e9bf6578a565d75beea2899a676e6cc720" => :lion
  end

  def install
    man1.install "doc/eyeD3.1.in" => "eyeD3.1"

    # Manually process this file
    inreplace "src/eyeD3/__init__.py.in" do |s|
      s.change_make_var! "eyeD3Version", "\"#{version}\""
      s.change_make_var! "eyeD3Maintainer", "\"Packaged by Homebrew\""
    end
    mv "src/eyeD3/__init__.py.in", "src/eyeD3/__init__.py"

    libexec.install "src/eyeD3"
    libexec.install "bin/eyeD3" => "eyeD3_script"
    bin.install_symlink libexec+"eyeD3_script" => "eyeD3"
  end
end
