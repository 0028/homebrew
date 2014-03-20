require 'formula'

class GoAppEngine64 < Formula
  homepage 'http://code.google.com/appengine/docs/go/overview.html'
  url 'https://commondatastorage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_darwin_amd64-1.9.1.zip'
  sha1 '3a0b848bc538a36a9d4aa896d206f4a95891f322'

  bottle do
    sha1 "709cc42a29bcf4a362c64209579731ecd4334839" => :mavericks
    sha1 "bc728216a9ab60db06d68ad2390daa04911394d7" => :mountain_lion
    sha1 "68c442f85c4c93f217f876f8c5a88ef0559e4081" => :lion
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
