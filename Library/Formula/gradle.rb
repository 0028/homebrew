require 'formula'

class Gradle < Formula
  homepage 'http://www.gradle.org/'
  url 'http://services.gradle.org/distributions/gradle-1.11-bin.zip'
  sha1 '87ac712975341a65ca1e8ee607e663c45b3b3d9d'

  bottle do
    cellar :any
    sha1 "fea9202258609637b26a2a0cccf9c3dd12b0338f" => :mavericks
    sha1 "a45bbf123fd1c22824f8bc24db89ab80246ffce8" => :mountain_lion
    sha1 "de73c4006995bddffd3f6ba182b3e62c17b12901" => :lion
  end

  def install
    libexec.install %w[bin lib]
    bin.install_symlink libexec+'bin/gradle'
  end
end
