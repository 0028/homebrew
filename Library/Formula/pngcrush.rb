require 'formula'

class Pngcrush < Formula
  homepage 'http://pmt.sourceforge.net/pngcrush/'
  # Stay at least one version behind and use the old-versions directory,
  # because tarballs are routinely removed and upstream won't change this
  # practice.
  url 'http://downloads.sourceforge.net/project/pmt/pngcrush/old-versions/1.7/1.7.69/pngcrush-1.7.69.tar.gz'
  sha1 'ccc2a4c678da44673087dd63c98fafca68b1670d'

  bottle do
    cellar :any
    sha1 "c0f5670624219277e975cf61da3461adc60520be" => :mavericks
    sha1 "d6cb8007bf693b1525ab76eadd97997dbf0bf285" => :mountain_lion
    sha1 "b6d97704ed807db97c9c424aa4d8f35efbba39e4" => :lion
  end

  def install
    # Required to successfully build the bundled zlib 1.2.6
    ENV.append_to_cflags "-DZ_SOLO"
    # Required to enable "-cc" (color counting) option (disabled by default since 1.5.1)
    ENV.append_to_cflags "-DPNGCRUSH_COUNT_COLORS"

    system "make", "CC=#{ENV.cc}",
                   "LD=#{ENV.cc}",
                   "CFLAGS=#{ENV.cflags}",
                   "LDFLAGS=#{ENV.ldflags}"
    bin.install 'pngcrush'
  end
end
