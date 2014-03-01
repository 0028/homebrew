require 'formula'

class Yafc < Formula
  homepage 'http://www.yafc-ftp.com/'
  url 'http://www.yafc-ftp.com/upload/yafc-1.3.2.tar.xz'
  sha1 'a4cd5518b84cd40c4503f2e022ba946a8bd5484a'

  bottle do
    sha1 "c913295ee0dc6472404282735b0e5f5e0ce690f3" => :mavericks
    sha1 "92aecb7f0d26a338807169d3d439954cf21bfefa" => :mountain_lion
    sha1 "f2edfbdb946ba7247fde08085005c81250270f0e" => :lion
  end

  depends_on 'xz' => :build
  depends_on 'readline'
  depends_on 'libssh' => :recommended

  def patches
    DATA
  end

  def install
    readline = Formula["readline"].opt_prefix

    args = ["--prefix=#{prefix}",
            "--with-readline=#{readline}"]
    args << "--without-ssh" if build.without? "libssh"

    system "./configure", *args
    system "make", "install"
  end

  test do
    system "#{bin}/yafc", "-V"
  end
end

__END__
# The bash-completion script assumes GNU sed and its 'r' option for
# extended regular expressions. OSX's sed calls this 'E' (they're not
# entirely compatible, but enough for this use case).
diff --git a/completion/yafc b/completion/yafc
index 03c452a..87f02e2 100644
--- a/completion/yafc
+++ b/completion/yafc
@@ -8,7 +8,7 @@ _yafc()
     cur=`_get_cword`
 
     if [ $COMP_CWORD -eq 1 ] && [ -f ~/.yafc/bookmarks ]; then
-        COMPREPLY=( $( compgen -W '$( sed -nre "/machine/ s/.* alias '\''([^'\'']*)'\''/\1/ p" \
+        COMPREPLY=( $( compgen -W '$( sed -nEe "/machine/ s/.* alias '\''([^'\'']*)'\''/\1/ p" \
             ~/.yafc/bookmarks )' -- "$cur" ) )
     fi
 

