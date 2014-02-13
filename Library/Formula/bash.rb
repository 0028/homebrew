require 'formula'

class Bash < Formula
  homepage 'http://www.gnu.org/software/bash/'
  url 'http://ftpmirror.gnu.org/bash/bash-4.2.tar.gz'
  bottle do
    sha1 "a291278f20dc9c14a9db8fd8e96d5f8e7d51f38a" => :mavericks
    sha1 "5aa924ceb098b0b0ec71d99cdb4875daddfb0d84" => :mountain_lion
    sha1 "915a3a58e045d9794612ce72a338f1bfe13fd5f1" => :lion
  end

  mirror 'ftp://ftp.cwru.edu/pub/bash/bash-4.2.tar.gz'
  sha256 'a27a1179ec9c0830c65c6aa5d7dab60f7ce1a2a608618570f96bfa72e95ab3d8'
  version '4.2.45'

  devel do
    url 'ftp://ftp.cwru.edu/pub/bash/bash-4.3-rc2.tar.gz'
    sha1 'e0b2012b0aacf1ba2791b1c0e364364eaa31436d'
  end

  head 'git://git.sv.gnu.org/bash.git', :branch => 'devel'

  if build.stable?
    depends_on 'readline' => :recommended

    # Vendor the patches. The mirrors are unreliable for getting the patches,
    # and the more patches there are, the more unreliable they get. Upstream
    # patches can be found in: http://ftpmirror.gnu.org/bash/bash-4.2-patches
    def patches
      # http://article.gmane.org/gmane.comp.shells.bash.bugs/20242
      p = { :p1 => DATA }
      p[:p0] = 'https://gist.github.com/jacknagel/4008180/raw/1509a257060aa94e5349250306cce9eb884c837d/bash-4.2-001-045.patch'
      p
    end
  end

  def install
    # When built with SSH_SOURCE_BASHRC, bash will source ~/.bashrc when
    # it's non-interactively from sshd.  This allows the user to set
    # environment variables prior to running the command (e.g. PATH).  The
    # /bin/bash that ships with Mac OS X defines this, and without it, some
    # things (e.g. git+ssh) will break if the user sets their default shell to
    # Homebrew's bash instead of /bin/bash.
    ENV.append_to_cflags '-DSSH_SOURCE_BASHRC'

    args = ["--prefix=#{prefix}"]

    if (build.without? 'readline') && build.stable?
      args << '--with-installed-readline'
    end

    system './configure', *args
    system 'make install'
  end

  def caveats; <<-EOS.undent
    In order to use this build of bash as your login shell,
    it must be added to /etc/shells.
    EOS
  end

  test do
    output = %x(#{bin}/bash -c "echo hello").strip
    assert_equal 'hello', output
    assert_equal 0, $?.exitstatus
  end
end

__END__
diff --git a/parse.y b/parse.y
index b5c94e7..085e5e4 100644
--- a/parse.y
+++ b/parse.y
@@ -5260,9 +5260,16 @@ decode_prompt_string (string)
 #undef ROOT_PATH
 #undef DOUBLE_SLASH_ROOT
 		else
+		  {
 		  /* polite_directory_format is guaranteed to return a string
 		     no longer than PATH_MAX - 1 characters. */
-		  strcpy (t_string, polite_directory_format (t_string));
+                  /* polite_directory_format might simply return the pointer to t_string
+                     strcpy(3) tells dst and src may not overlap, OS X 10.9 asserts this and
+                     triggers an abort trap if that's the case */
+                  temp = polite_directory_format (t_string);
+                  if (temp != t_string)
+                   strcpy (t_string, temp);
+		  }
 
 		temp = trim_pathname (t_string, PATH_MAX - 1);
 		/* If we're going to be expanding the prompt string later,
