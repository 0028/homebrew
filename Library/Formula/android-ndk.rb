require 'formula'

class AndroidNdk < Formula
  homepage 'http://developer.android.com/sdk/ndk/index.html'
  url 'http://dl.google.com/android/ndk/android-ndk-r9b-darwin-x86.tar.bz2'
  sha1 'e9e44144a1db987f917eafe9fa2dc0b0de3ee78f'

  bottle do
    sha1 '46c321e9b90c1c91045010b1e266c346c56ed9be' => :mavericks
    sha1 '0c67282b240ab7bdf4c7b0677cf82b51ce21cb4c' => :mountain_lion
    sha1 '898ba22997dd8c71556ed7e6202f4e5128ee814c' => :lion
  end

  depends_on 'android-sdk'

  def install
    bin.mkpath
    prefix.install Dir['*']

    # Create a dummy script to launch the ndk apps
    ndk_exec = prefix+'ndk-exec.sh'
    (ndk_exec).write <<-EOS.undent
      #!/bin/sh
      BASENAME=`basename $0`
      EXEC="#{prefix}/$BASENAME"
      test -f "$EXEC" && exec "$EXEC" "$@"
    EOS
    (ndk_exec).chmod 0755
    %w[ ndk-build ndk-gdb ndk-stack ].each { |app| ln_s ndk_exec, bin+app }
  end

  def caveats; <<-EOS.undent
    We agreed to the Android NDK License Agreement for you by downloading the NDK.
    If this is unacceptable you should uninstall.

    License information at:
    http://developer.android.com/sdk/terms.html

    Software and System requirements at:
    http://developer.android.com/sdk/ndk/index.html#requirements

    For more documentation on Android NDK, please check:
      #{prefix}/docs
    EOS
  end
end
