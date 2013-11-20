require 'formula'

class Gradle < Formula
  homepage 'http://www.gradle.org/'
  url 'http://services.gradle.org/distributions/gradle-1.9-bin.zip'
  sha1 'e35f498e7e52d2ee3a12d313eb4c3d7805e6a346'

  bottle do
    cellar :any
    sha1 '88a41121194b1d0b96cd357e5b2bb070fe4e930a' => :mavericks
    sha1 'fe2fdc702cf659b0e7a1800abafae66fd5fd31a8' => :mountain_lion
    sha1 '9dcddaa94c815dd12989aa02a837c3e5b19b08f5' => :lion
  end

  def install
    libexec.install %w[bin lib]
    bin.install_symlink libexec+'bin/gradle'
  end
end
