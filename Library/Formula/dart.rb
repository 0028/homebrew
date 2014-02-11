require 'formula'

class Dart < Formula
  homepage 'http://www.dartlang.org/'

  if MacOS.prefer_64_bit?
    url 'http://storage.googleapis.com/dart-archive/channels/stable/release/32314/sdk/dartsdk-macos-x64-release.zip'
  bottle do
    sha1 "2da04ffddde2e409343427bce81073538e72b856" => :mavericks
    sha1 "85b86d08ef4434899dc8d6529e5f808d2421f43a" => :mountain_lion
    sha1 "e5633095d0ac1613fb2c41a767762b39cc89a637" => :lion
  end

    sha1 'c5becd88d9d2348193b954e3d9077d86f30b2536'
  else
    url 'http://storage.googleapis.com/dart-archive/channels/stable/release/32314/sdk/dartsdk-macos-ia32-release.zip'
    sha1 '3070a2aa852ed1769763568ef91736235ac5bd2a'
  end

  version '1.1.3'

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
