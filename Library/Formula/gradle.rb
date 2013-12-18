require 'formula'

class Gradle < Formula
  homepage 'http://www.gradle.org/'
  url 'http://services.gradle.org/distributions/gradle-1.10-bin.zip'
  sha1 'f911beeff25ebbb7b4af3092dd7f0c93019aef17'

  bottle do
    cellar :any
    sha1 '0dac05908013afd56912f6511d9dfedecba7c16f' => :mavericks
    sha1 '2da7734c22c5d1d4b114c71cf9ec4adaa715e788' => :mountain_lion
    sha1 'df8fa2c1a15a9bbcd0adc9ff9c8283ab885d4794' => :lion
  end

  def install
    libexec.install %w[bin lib]
    bin.install_symlink libexec+'bin/gradle'
  end
end
