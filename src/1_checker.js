<script type="text/javascript" language=JavaScript><!--
function t(f) { n=false;
c=f[0].value.match(/([\wÁ-Ñá-ñ-]+)/);if(!c){alert("Please, enter your login in plain characters");f[0].focus();return n};f[0].value=c[0]
if((f[1].value=="")||(f[1].value!=f[2].value)){alert("Passwords mismatch or empty");f[1].focus();f[1].select();return n}
c=f[3].value.match(/(-?\d*\.?\d+)/);if(!c){alert("Please, enter number");f[3].focus();f[3].select();return n};f[3].value=c[0]
c=f[4].value.match(/([\w\.-_]+@[\w\.-_]+)/);if(!c){alert("Please, enter e-mail address");f[4].focus();return n};f[4].value=c[0].toLowerCase()
c=f[4].value.match(/^[_\w-]*(\.[-\w_]+)*@[-\w_]+(\.[_\w-]+)*\.(com|gov|edu|org|mil|net|\w{2})$/);if(!c){alert("Sorry, this e-mail invalid");f[4].focus();f[4].select();return n}
if(f[5].value==""){w=new Date();f[5].value=w.getFullYear()+"-"+w.getMonth()+"-"+w.getDate();return true}
c=f[5].value.match(/^[^\d]*(\d{4})-(\d{1,2})-(\d{1,2})[^\d]*$/);if(!c){alert("Please, enter date like yyyy-mm-dd");f[5].focus();f[5].select();return n};y=c[1];m=c[2];d=c[3];ds=new Array(31,29,31,30,31,30,31,31,30,31,30,31);if(d<1||d>ds[m-1]||m<1||m>12){alert("Sorry, this date invalid");f[5].focus();f[5].select();return n};f[5].value=y+"-"+m+"-"+d;return true}
c=f[6].value.match(/(http:\/\/)?[\w_-]+(\.[_\w-]+)*\.(com|gov|edu|org|mil|net|\w{2})$/);if(!c){alert("Sorry, that not a site");f[6].focus();f[6].select();return n}
--></script>
