require 'formula'

class GoAppEngine32 < Formula
  homepage 'http://code.google.com/appengine/docs/go/overview.html'
  url 'https://commondatastorage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_darwin_386-1.9.0.zip'
  sha1 '08ab3cddd752d7db9c84153e4e93bf2205707935'

  bottle do
    cellar :any
    sha1 "edc78ddc4b0b32017ab14f8bbbea36f4ea6faa2d" => :mavericks
    sha1 "a7ae23100173c3b1aa479235105f7f2c2ff2cddb" => :mountain_lion
    sha1 "50b3e3b2e2082c2eff07b131026cb3fe1fc6f27d" => :lion
  end

  def install
    cd '..'
    share.install 'go_appengine' => name
    bin.mkpath
    %w[
      api_server.py appcfg.py bulkloader.py bulkload_client.py dev_appserver.py download_appstats.py goapp
    ].each do |fn|
      ln_s share+name+fn, bin
    end
  end
end
