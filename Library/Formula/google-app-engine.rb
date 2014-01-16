require 'formula'

class GoogleAppEngine < Formula
  homepage 'https://developers.google.com/appengine/'
  url 'http://googleappengine.googlecode.com/files/google_appengine_1.8.9.zip'
  sha1 '6a5a79a81bf0f1fccf5b56dac41be6174888983e'

  bottle do
    cellar :any
    sha1 'ccf629d6552ecb4c33287c18281c5085713e3107' => :mavericks
    sha1 'c5ce18bf83681d711b4c3b6c180d51ab564647fa' => :mountain_lion
    sha1 '1ece18a45f14534bf160be1088b4c0d9832f28c9' => :lion
  end

  def install
    cd '..'
    share.install 'google_appengine' => name
    bin.mkpath
    %w[
      _python_runtime.py
      _php_runtime.py
      api_server.py
      appcfg.py
      bulkload_client.py
      bulkloader.py
      dev_appserver.py
      download_appstats.py
      endpointscfg.py
      gen_protorpc.py
      google_sql.py
      old_dev_appserver.py
      remote_api_shell.py
    ].each do |fn|
      ln_s share+name+fn, bin
    end
  end
end
