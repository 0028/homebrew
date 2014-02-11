require 'formula'

class Gwt < Formula
  homepage 'https://developers.google.com/web-toolkit/'
  url 'http://google-web-toolkit.googlecode.com/files/gwt-2.6.0.zip'
  sha1 '36d45c9dffbe59d15c6f6d04657438dc78e343c1'

  bottle do
    sha1 "4c218f1a2c229408c14cbc481119fd208df963ed" => :mavericks
    sha1 "5b86958b91775f89d21f7164e0c04260a35a4d7e" => :mountain_lion
    sha1 "570aa99f49409ec2a2f157dd242a4e969dd2e2cd" => :lion
  end

  def install
    rm Dir['*.cmd'] # remove Windows cmd files
    share.install Dir['*']

    # Don't use the GWT scripts because they expect the GWT jars to
    # be in the same place as the script.
    (bin/'webAppCreator').write <<-EOS.undent
      #!/bin/sh
      HOMEDIR=#{share}
      java -cp "$HOMEDIR/gwt-user.jar:$HOMEDIR/gwt-dev.jar" com.google.gwt.user.tools.WebAppCreator "$@";
    EOS

    (bin/'benchmarkViewer').write <<-EOS.undent
      #!/bin/sh
      APPDIR=#{share}
      java -Dcom.google.gwt.junit.reportPath="$1" -cp "$APPDIR/gwt-dev.jar" com.google.gwt.dev.RunWebApp -port auto $APPDIR/gwt-benchmark-viewer.war;
    EOS

    (bin/'i18nCreator').write <<-EOS.undent
      #!/bin/sh
      HOMEDIR=#{share}
      java -cp "$HOMEDIR/gwt-user.jar:$HOMEDIR/gwt-dev.jar" com.google.gwt.i18n.tools.I18NCreator "$@";
    EOS

  end

  def caveats
    <<-EOS.undent
      The GWT jars are available at #{share}
    EOS
  end
end
