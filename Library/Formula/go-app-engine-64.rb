require 'formula'

class GoAppEngine64 < Formula
  homepage 'http://code.google.com/appengine/docs/go/overview.html'
  url 'http://googleappengine.googlecode.com/files/go_appengine_sdk_darwin_amd64-1.8.9.zip'
  sha1 '645d78a48010131a601aa8508541001a6a81dab8'

  bottle do
    cellar :any
    sha1 '5ecb1354db9e8bd8ea475d8f01f8c4cc5b926315' => :mavericks
    sha1 '15037cdb2fb22d3fb5f0acd6d28dcb46dda3bfd6' => :mountain_lion
    sha1 'b979c990929feef87ccd42c1b3caac545b8b484f' => :lion
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
