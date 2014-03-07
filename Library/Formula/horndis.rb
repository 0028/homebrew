require "formula"

class Horndis < Formula
  homepage "http://joshuawise.com/horndis"
  url "https://github.com/jwise/HoRNDIS/archive/rel5.tar.gz"
  sha1 "5f01c62ae61554252c0fe727e414edcb8e060106"

  bottle do
    cellar :any
    sha1 "b198a56898ec9bd603102a54aab34ecb4cc24b24" => :mavericks
    sha1 "7926f4ef892082e4b2ad8c59421d6e04b96d35b6" => :mountain_lion
    sha1 "f462cc30b522d3891b4ddc0af062026cf3325109" => :lion
  end

  depends_on :xcode

  def install
    xcodebuild "-configuration", "Release", "SDKROOT=", "MACOSX_DEPLOYMENT_TARGET=", "GCC_VERSION=", "ONLY_ACTIVE_ARCH=YES", "SYMROOT=build"
    kext_prefix.install "build/Release/HoRNDIS.kext"
  end

  def caveats; <<-EOS.undent
    In order for HoRNDIS to work, kernel extension must be installed by the root user:
    $ sudo /bin/cp -rfX #{kext_prefix}/HoRNDIS.kext /Library/Extensions
    EOS
  end
end
