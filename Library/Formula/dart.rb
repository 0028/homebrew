require 'formula'

class Dart < Formula
  homepage 'http://www.dartlang.org/'

  if MacOS.prefer_64_bit?
    url 'http://storage.googleapis.com/dart-archive/channels/stable/release/33014/sdk/dartsdk-macos-x64-release.zip'
  bottle do
    cellar :any
    sha1 "05b05ce5933b3483506c0852aacbb0d53448d796" => :mavericks
    sha1 "acf26d3800fed7531bcf7fe89e95c7fa05f6d10d" => :mountain_lion
    sha1 "3662c547b6f470529211b4b4a3e090d2d944bb77" => :lion
  end

    sha1 '006da52e5a48ad07830d4b8c777f417e5ffa11db'
  else
    url 'http://storage.googleapis.com/dart-archive/channels/stable/release/33014/sdk/dartsdk-macos-ia32-release.zip'
    sha1 '789d07dda0e87f2a679a50841e70c458bbf122ca'
  end

  version '1.2.0'

  def install
    libexec.install Dir['*']
    bin.install_symlink "#{libexec}/bin/dart"
    bin.write_exec_script Dir["#{libexec}/bin/{pub,dart?*}"]
  end

  def caveats; <<-EOS.undent
    To use with IntelliJ, set the Dart home to:
      #{opt_prefix}/libexec
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
