require 'formula'

class GoAppEngine64 < Formula
  homepage 'http://code.google.com/appengine/docs/go/overview.html'
  url 'https://commondatastorage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_darwin_amd64-1.9.3.zip'
  sha1 '8d77270b73c1d4892cb54d9e6ff3b592f4f35970'

  bottle do
    cellar :any
    sha1 "adcbfb4e2db7eb64d07c3fbf3befc8d467d72dc3" => :mavericks
    sha1 "6fc3b83bb8c9e6550d5e381cee99857914fde43c" => :mountain_lion
    sha1 "9192ea818729eeaa7cece2c32185ffce20c83b27" => :lion
  end

  def install
    cd '..'
    share.install 'go_appengine' => name
    %w[
      api_server.py appcfg.py bulkloader.py bulkload_client.py dev_appserver.py download_appstats.py goapp
    ].each do |fn|
      bin.install_symlink share/name/fn
    end
  end
end
