require 'formula'

class GoogleAppEngine < Formula
  homepage 'https://developers.google.com/appengine/'
  url 'https://commondatastorage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.3.zip'
  sha1 '4d4a535604a05bda3972c1abff6289f9b2ed9bfd'

  bottle do
    cellar :any
    sha1 "9a14178d926eabeacfb360472ab94a0b93246e99" => :mavericks
    sha1 "14666894e3ccdc8e9dc761d3350bcb859cdefb51" => :mountain_lion
    sha1 "fcebc18322a59909c0cb4ab5abade4c4db0c0c18" => :lion
  end

  def install
    cd '..'
    share.install 'google_appengine' => name
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
      bin.install_symlink share/name/fn
    end
  end
end
