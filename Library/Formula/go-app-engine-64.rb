require 'formula'

class GoAppEngine64 < Formula
  homepage 'http://code.google.com/appengine/docs/go/overview.html'
  url 'https://commondatastorage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_darwin_amd64-1.9.0.zip'
  sha1 '0e660230e4cfaac1b9dacff993d5128ef84c0fb9'

  bottle do
    cellar :any
    sha1 "86347e204ff2e3ea9588932bddfce18db4b28b93" => :mavericks
    sha1 "b81e8d716158cac9e1c4ae54a0c742cc0867046f" => :mountain_lion
    sha1 "afe104edbbd2cddaba267dbb0daf3da92ef94d74" => :lion
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
