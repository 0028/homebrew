require 'formula'

class Ngrok < Formula
  homepage 'https://ngrok.com/'
  url 'https://dl.ngrok.com/darwin_amd64/ngrok.zip'
  sha1 '3c34a7d2b44226ab99b9b51fadc7808db7ace8ff'
  version '1.6'

  def install
    bin.install Dir['*']
  end
end
