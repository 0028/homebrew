require 'formula'

class Gcutil < Formula
  homepage 'https://developers.google.com/compute/docs/gcutil/'
  url 'https://dl.google.com/dl/cloudsdk/release/artifacts/gcutil-1.14.0.zip'
  sha1 '10f34bfee7e3865cad14ad27caae446aedab9038'

  bottle do
    cellar :any
    sha1 "f9094f8b27302c507327a4d902e1cf167d4dd234" => :mavericks
    sha1 "06dae9370c15736cbcefe92e61ea412c44cd005d" => :mountain_lion
    sha1 "662f6cc39e25e267241016d5a7c07398e114507a" => :lion
  end

  def install
    libexec.install 'gcutil', 'lib'
    bin.install_symlink libexec/"gcutil"
  end

  test do
    system "#{bin}/gcutil", "version"
  end
end
