require 'formula'

class GitTf < Formula
  homepage 'http://gittf.codeplex.com/'
  url 'http://download.microsoft.com/download/A/E/2/AE23B059-5727-445B-91CC-15B7A078A7F4/git-tf-2.0.3.20131219.zip'
  sha1 'a16f98aa1cd6bff2931b2fa361711ca7051258f4'

  bottle do
    sha1 "6050e127409a47f808e1128713502ab6d86faa0e" => :mavericks
    sha1 "fe8a26973c1ab3d7bfc02346fa965ea26f8a2354" => :mountain_lion
    sha1 "7e655f19b6ea48aece4591657426584e564784b5" => :lion
  end

  head do
    url 'https://git01.codeplex.com/gittf', :using => :git
    depends_on 'maven'
  end

  def install
    if build.stable?
      install_prefix = ''
    else
      system 'mvn', 'assembly:assembly'
      system 'unzip', Dir['target/git-tf-*.zip'], "-dtarget"
      install_prefix = Dir['target/git-tf-*/'].to_s
    end

    libexec.install install_prefix + 'git-tf'
    libexec.install install_prefix + 'lib'
    (libexec + "native").install install_prefix + 'native/macosx'

    bin.write_exec_script libexec/'git-tf'
    (share/'doc/git-tf').install Dir['Git-TF_*'] + Dir['ThirdPartyNotices*']
  end

  def caveats; <<-EOS.undent
    This release removes support for TFS 2005 and 2008. Use a previous version if needed.
    EOS
  end

  test do
    system "#{bin}/git-tf"
  end
end
