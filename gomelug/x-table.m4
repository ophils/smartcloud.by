m4_changequote([, ])m4_dnl
m4_define(extable, [
</head><body>
<table cellpadding=0 cellspacing=3 border=0 summary="макет страницы">
<tr valign=top><td><a href=../index.html><img src="../img/topbox.gif" alt="Остров пингвинов"></a></td>
<td height=60 bgcolor="#FFCC33"></td></tr>
<tr><td colspan=2><img src="../img/blue-line.gif" width=600 height=5
alt="- - - - - - - - - - - - - - - - - - - - - - -">
<tr valign=top><td width=131>
<img name="corner" src="../img/articles.gif" width=125 height=91 alt="$2"><br><br>
m4_ifelse($1, 1, <b>Для начинающих</b><br><br>, <a href="../articles/newbie.html" onmouseover="document.corner.src='../img/newbie.gif';return true" onmouseout="document.corner.src='../img/$3';return true">Для начинающих</a><br><br>)
m4_ifelse($1, 2, <b>Для знатоков</b><br><br>, <a href="../articles/guru.html" onmouseover="document.corner.src='../img/guru.gif';return true" onmouseout="document.corner.src='../img/$3';return true">Для знатоков</a><br><br>)
m4_ifelse($1, 3, <b>Для души</b><br><br>, <a href="../articles/community.html" onmouseover="document.corner.src='../img/forum.gif';return true" onmouseout="document.corner.src='../img/$3';return true">Для души</a><br><br>)
m4_ifelse($1, 4, <b>О нас</b><br><br>, <a href="../articles/about.html" onmouseover="document.corner.src='../img/about.gif';return true" onmouseout="document.corner.src='../img/$3';return true">О нас</a>)
m4_shift(m4_shift(m4_shift($@)))m4_dnl
</td><td>
])m4_dnl
m4_changequote(`, ')m4_dnl
