m4_divert(-1)

m4_define(`_Copyleft',
`Copyright (C) 1997 Bob Hepple, 2003 Oleg P. Philon

This program is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public
License as published by the Free Software Foundation; either
version 2 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.  See the GNU General Public License for more
details.

You should have received a copy of the GNU General Public
License along with this program; if not, write to the Free
Software Foundation, Inc., 675 Mass Ave, Cambridge, MA
02139, USA.')

m4_changecom(`[[[[')

m4_dnl -- m4_changeword(`[_a-zA-Z][_a-zA-Z0-9<>]*') return to std m4
m4_define(`_concat', `ifelse(1, $#, `$1', `$1` '_concat(shift($@))')')
m4_define(`_l_d', m4_esyscmd(`echo -n $(hostname -d)'))
m4_define(`_local_domain', m4_ifelse(_l_d, gomel.by, riva.gomel.by, `_l_d'))

m4_dnl logical markup:

m4_define(`_em',<em>$*</em>)
m4_define(`_strong',<strong>$*</strong>)
m4_define(`_cite',<cite>$*</cite>)
m4_define(`_pre',<blockquote><pre>
$*</pre></blockquote>)
m4_define(`_code',<code>$*</code>)
m4_define(`_codequote',_pre(_code($*)))

m4_dnl physical markup:

m4_define(`_bold',<b>$*</b>)
m4_define(`_italics',<i>$*</i>)
m4_define(`_strike',<s>$*</s>)
m4_define(`_subscript',<sub>$*</sub>)
m4_define(`_superscript',<sup>$*</sup>)
m4_define(`_courier',<tt>$*</tt>)
m4_define(`_tt',<tt>$*</tt>)
m4_define(`_underline',<u>$*</u>)
m4_define(`_small',<small>$*</small>)
m4_define(`_big',<big>$*</big>)

m4_define(`_center',<center>$*</center>)

m4_define(`_limage', <img src="$1" alt="[$1]" width=$2 height=$3>)

m4_define(`_rimage', <img src="$1" alt="[$1]" width=$2 height=$3 align="right">)

m4_define(`_image', <p><center><img src="$1" alt="[$1]" width=$2 height=$3></center><p>)

m4_define(`_image2',<p><center>
<img src="$1" alt="[$1]" align=top width=$2 height=$3>
<img src="$4" alt="[$4]" align=top width=$5 height=$6>
</center><p>)

m4_define(`_ftp',<a href="ftp://$1">$2</a>)

m4_define(`_head1', <h2>$*</h2>)

m4_define(`_head2', <h3>$*</h3>)

m4_define(`_link', `<a href="$1">m4_shift($@)</a>')

m4_define(`_selflink', _link($1,$1))

m4_define(`_locallink',<a href="#$1">$2</a>)

m4_define(`_label', `<a name="$1">m4_shift($@)</a>')

m4_define(`_mailto',<a href="mailto:$1">$2</a>)


m4_define(`_link_to_label', _locallink($1,$1))

m4_dnl ----------------------------------------------
m4_dnl table of contents

m4_define(`_start_toc',`<ul>m4_divert(-1)
  m4_define(`_h1_num',0)
  m4_define(`_h2_num',0)
  m4_define(`_h3_num',0)
  m4_define(`_h4_num',0)
  m4_divert(1)')

m4_define(`_h1', `m4_divert(-1)
  m4_define(`_h1_num',m4_incr(_h1_num))
  m4_define(`_h2_num',0)
  m4_define(`_h3_num',0)
  m4_define(`_h4_num',0)
  m4_define(`_toc_label',`_h1_num. $*')
  m4_divert(0)<li><a href="#_h1_num">_toc_label</a>
  m4_divert(1)<h2><a name="_h1_num">_toc_label</a></h2>')

m4_define(`_h2', `m4_divert(-1)
  m4_define(`_h2_num',m4_incr(_h2_num))
  m4_define(`_h3_num',0)
  m4_define(`_h4_num',0)
  m4_define(`_toc_label',`_h1_num._h2_num $*')
  m4_divert(0)<li><a href="#_h1_num._h2_num">_toc_label</a>
  m4_divert(1)<h2><a name="_h1_num._h2_num">_toc_label</a></h2>')

m4_define(`_h3', `m4_divert(-1)
  m4_define(`_h3_num',m4_incr(_h3_num))
  m4_define(`_h4_num',0)
  m4_define(`_toc_label',`_h1_num._h2_num._h3_num $*')
  m4_divert(0)<li><a href="#_h1_num._h2_num._h3_num">_toc_label</a>
  m4_divert(1)<h2><a name="_h1_num._h2_num._h3_num">_toc_label</a></h2>')

m4_define(`_h4', `m4_divert(-1)
  m4_define(`_h4_num',m4_incr(_h4_num))
  m4_define(`_toc_label',`_h1_num._h2_num._h3_num._h4_num $*')
  m4_divert(0)<li><a href="#_h1_num._h2_num._h3_num._h4_num">_toc_label</a>
  m4_divert(1)<h2><a name="_h1_num._h2_num._h3_num._h4_num">_toc_label</a></h2>')

m4_define(`_end_toc',`m4_divert(0)</ul>')

m4_dnl ----------------------------------------------
m4_dnl tables

m4_dnl _start_table(columns,table parameters)
m4_dnl defaults are border=1 cellpadding="1" cellspacing="1"
m4_dnl width="n" pixels or "n%" of screen width
m4_define(`_start_table',`<table $1>')

m4_define(`_table_hdr_item', `<th>$1</th>m4_ifelse($#,1,,`_table_hdr_item(m4_shift($@))')')

m4_define(`_table_row_item', `<td>$1</td>m4_ifelse($#,1,,`_table_row_item(m4_shift($@))')')

m4_define(`_table_hdr',`<tr>_table_hdr_item($@)</tr>')
m4_define(`_table_row',`<tr>_table_row_item($@)</tr>')

m4_define(`_end_table',</table>)

m4_divert`'m4_dnl
