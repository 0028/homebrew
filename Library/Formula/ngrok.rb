require 'formula'

class Ngrok < Formula
  homepage 'https://ngrok.com/'
  url 'https://dl.ngrok.com/darwin_amd64/ngrok.zip'
  sha1 '3c34a7d2b44226ab99b9b51fadc7808db7ace8ff'
  version '1.6'

  bottle do
    sha1 "f6077370cc362054bc95d4b0314dcf120e0b16f1" => :mavericks
    sha1 "60e5c34a894a4e03424e34dbba7ba26f8796e0b4" => :mountain_lion
    sha1 "0882557c54101ec228b6e1d5ec2e86b7f7e99366" => :lion
  end

  def install
    bin.install Dir['*']
  end
end
