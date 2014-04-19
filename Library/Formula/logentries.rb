require 'formula'

class Logentries < Formula
  homepage 'https://logentries.com/doc/agent/'
  url 'https://github.com/logentries/le/archive/v1.3.0.tar.gz'
  sha1 '3d32c8c6a8faf9346558974310787c0dd9c3f468'

  bottle do
    cellar :any
    sha1 "3abb80bbd1567cf90e4e847cc0235d1fd3672e96" => :mavericks
    sha1 "4bf835016b98150b88a5b05259b0bc2fbeffdc71" => :mountain_lion
    sha1 "6b32285504b9880ad0ea2fdd9989c42a9d0fcf99" => :lion
  end

  conflicts_with 'le', :because => 'both install a le binary'

  def install
    bin.install 'le'
  end
end
