require 'formula'

class Bagit < Formula
  homepage 'https://github.com/LibraryOfCongress/bagit-java'
  url 'https://github.com/LibraryOfCongress/bagit-java/releases/download/bagit-4.8.1/bagit-4.8.1-bin.zip'
  sha1 'a5f42372dcbe75f44d9181dd8edc8e6f18b68ec9'

  bottle do
    cellar :any
    sha1 "24805792d9159134aaad7ed254d5edb24500223a" => :mavericks
    sha1 "9173c6dccccd028e436ddb4515c6fea9b82d4cb3" => :mountain_lion
    sha1 "385d92e8f9351eee6808499ff52dbd57971866c0" => :lion
  end

  def install
    inreplace "conf/log4j.properties", "${app.home}/logs", "#{var}/log/bagit"
    (var/'log/bagit').mkpath

    prefix.install 'conf'

    libexec.install Dir['lib/*']

    # Point to libexec, and move conf file
    inreplace "bin/bag" do |s|
      s.gsub! "$APP_HOME/lib", "$APP_HOME/libexec"
      s.gsub! "/bin/$APP_NAME.classworlds.conf", "/conf/$APP_NAME.classworlds.conf"
    end
    inreplace "bin/bag.classworlds.conf", "${app.home}/lib", "${app.home}/libexec"

    bin.install 'bin/bag'
    (prefix+'conf').install 'bin/bag.classworlds.conf'
  end

  test do
    system bin/'bag'
  end
end
