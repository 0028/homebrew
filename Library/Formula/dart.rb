require 'formula'

class Dart < Formula
  homepage 'http://www.dartlang.org/'

  if MacOS.prefer_64_bit?
    url 'http://storage.googleapis.com/dart-archive/channels/stable/release/34825/sdk/dartsdk-macos-x64-release.zip'
  bottle do
    cellar :any
    sha1 "f04e5769f6bf5e0a00b00b18a5259ec3915552eb" => :mavericks
    sha1 "35688ac27362e1e66bb79308cfc6bf32d1777246" => :mountain_lion
    sha1 "b19218eb24ab5bff781d5de4b567dcb682eaaef5" => :lion
  end

    sha1 '89d372cd66de991b02ac54fe85371a3ef7e59242'
  else
    url 'http://storage.googleapis.com/dart-archive/channels/stable/release/34825/sdk/dartsdk-macos-ia32-release.zip'
    sha1 'f98effcebafd1c2b4aeac73c6854e0cab15037d7'
  end

  version '1.3.0'

  def install
    libexec.install Dir['*']
    bin.install_symlink "#{libexec}/bin/dart"
    bin.write_exec_script Dir["#{libexec}/bin/{pub,dart?*}"]
  end

  def caveats; <<-EOS.undent
    To use with IntelliJ, set the Dart home to:
      #{opt_libexec}
    EOS
  end

  test do
    (testpath/'sample.dart').write <<-EOS.undent
      void main() {
        print(r"test message");
      }
    EOS

    assert_equal "test message\n", `#{bin}/dart sample.dart`
  end
end
