require 'formula'

class Nu < Formula
  homepage 'http://programming.nu'
  url 'https://github.com/timburks/nu/archive/v2.1.1.tar.gz'
  sha1 'ca0f9bbd5bbdb8528be516325f274d07d4be54bf'

  bottle do
    cellar :any
    sha1 '808f017e1ddb8902626f3a94d75b9e47ccbcd6a4' => :mavericks
    sha1 '3e41605f58b145490c5e1bdf4ec7bdc5f2faa68c' => :mountain_lion
    sha1 '36c0c7ac0e3326477171ca0976f8f572d2d100cc' => :lion
  end

  depends_on :macos => :lion
  depends_on 'pcre'

  fails_with :llvm do
    build 2336
    cause 'nu only builds with clang'
  end

  fails_with :gcc do
    build 5666
    cause 'nu only builds with clang'
  end

  def install
    ENV['PREFIX'] = prefix

    inreplace "Nukefile" do |s|
      case Hardware.cpu_type
      when :intel
        arch = :i386
      when :ppc
        arch = :ppc
      end
      arch = :x86_64 if arch == :i386 && Hardware.is_64_bit?
      s.gsub!('(SH "sudo ', '(SH "') # don't use sudo to install
      s.gsub!('#{@destdir}/Library/Frameworks', '#{@prefix}/Frameworks')
      s.sub! /^;; source files$/, <<-EOS
;; source files
(set @framework_install_path "#{frameworks}")
EOS
    end
    system "make"
    system "./mininush", "tools/nuke"
    bin.mkdir
    lib.mkdir
    include.mkdir
    system "./mininush", "tools/nuke", "install"
  end

  def caveats
    if self.installed? and File.exists? frameworks+"Nu.framework"
      return <<-EOS.undent
        Nu.framework was installed to:
          #{frameworks}/Nu.framework

        You may want to symlink this Framework to a standard OS X location,
        such as:
          ln -s "#{frameworks}/Nu.framework" /Library/Frameworks
      EOS
    end
    return nil
  end
end
