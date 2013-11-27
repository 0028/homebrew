require 'formula'

class Rock < Formula
  homepage 'http://ooc-lang.org'
  url 'https://github.com/nddrylliog/rock/archive/v0.9.8.tar.gz'
  sha1 'e9c7f2352d53351b60485b27c70858a0ad5cddb3'

  head 'https://github.com/nddrylliog/rock.git'

  bottle do
    sha1 'e74097ed3c5857f5510c10db426b041c789d4370' => :mavericks
    sha1 'a93d740341c1fcf71a1b92b05de3c4c05976d94e' => :mountain_lion
    sha1 'a499cb306bbb40f8784e4eda328d24ade1adb378' => :lion
  end

  depends_on 'bdw-gc'

  def install
      # make rock using provided bootstrap
      ENV['OOC_LIBS'] = prefix
      system "make rescue"
      bin.install 'bin/rock'
      man1.install "docs/rock.1"

      # install misc authorship files & rock binary in place
      # copy the sdk, libs and docs
      prefix.install "rock.use", 'README.md', "sdk", "libs", "docs"
  end
end
