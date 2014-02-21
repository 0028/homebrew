require 'formula'

class Tmux < Formula
  homepage 'http://tmux.sourceforge.net'
  url 'http://downloads.sourceforge.net/project/tmux/tmux/tmux-1.9/tmux-1.9.tar.gz'
  sha1 '43197e69716a0430a9e856c13df8ceae31783078'

  head do
    url 'git://git.code.sf.net/p/tmux/tmux-code'

    depends_on :autoconf
    depends_on :automake
    depends_on :libtool
  end

  depends_on 'pkg-config' => :build
  depends_on 'libevent'

  def install
    system "sh", "autogen.sh" if build.head?

    ENV.append "LDFLAGS", '-lresolv'
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--sysconfdir=#{etc}"
    system "make install"

    bash_completion.install "examples/bash_completion_tmux.sh" => 'tmux'
    (share/'tmux').install "examples"
  end

  def caveats; <<-EOS.undent
    Example configurations have been installed to:
      #{share}/tmux/examples
    EOS
  end

  def test
    system "#{bin}/tmux", "-V"
  end
end

__END__
diff --git a/osdep-darwin.c b/osdep-darwin.c
index 23de9d5..b5efe84 100644
--- a/osdep-darwin.c
+++ b/osdep-darwin.c
@@ -33,17 +33,17 @@ struct event_base	*osdep_event_init(void);
 char *
 osdep_get_name(int fd, unused char *tty)
 {
-	struct proc_bsdshortinfo	bsdinfo;
+	struct proc_bsdinfo bsdinfo;
	pid_t				pgrp;
	int				ret;

	if ((pgrp = tcgetpgrp(fd)) == -1)
		return (NULL);

-	ret = proc_pidinfo(pgrp, PROC_PIDT_SHORTBSDINFO, 0,
+	ret = proc_pidinfo(pgrp, PROC_PIDTBSDINFO, 0,
	    &bsdinfo, sizeof bsdinfo);
-	if (ret == sizeof bsdinfo && *bsdinfo.pbsi_comm != '\0')
-		return (strdup(bsdinfo.pbsi_comm));
+	if (ret == sizeof bsdinfo && *bsdinfo.pbi_comm != '\0')
+		return (strdup(bsdinfo.pbi_comm));
	return (NULL);
 }

diff --git a/utf8.c b/utf8.c
index 88d847a..34e5087 100644
--- a/utf8.c
+++ b/utf8.c
@@ -173,7 +173,7 @@ struct utf8_width_entry utf8_width_table[] = {
	{ 0x30000, 0x3fffd, 2, NULL, NULL },
	{ 0x00711, 0x00711, 0, NULL, NULL },
	{ 0x0fe00, 0x0fe0f, 0, NULL, NULL },
-	{ 0x01160, 0x011ff, 0, NULL, NULL },
+	{ 0x01160, 0x011ff, 1, NULL, NULL },
	{ 0x0180b, 0x0180d, 0, NULL, NULL },
	{ 0x10a3f, 0x10a3f, 0, NULL, NULL },
	{ 0x00981, 0x00981, 0, NULL, NULL },
