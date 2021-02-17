vpath %.text src
vpath %.html www
vpath %.inc src 
vpath %.err errors
src  := $(wildcard src/*.text)
html := $(patsubst %.text,%.html,$(notdir $(src)))
errs := $(patsubst %.html,%.err,$(html))
# inc  := $(patsubst %.x,%.inc,$(notdir $(ext)))  # ???
inc  := $(wildcard src/*.inc)
inc  += $(inc) www/1_philon.css
rest := $(wildcard *-table* *.css *.js text2* *-footer Makefile stdlib.m4)
addr := github.com 
user := ophilon@github.com
define scp
    scp $@ $(addr):
endef
define upload
git push
endef

help :
	./text2html
	@echo 'Вместо html-разметки имеются макросы типа _em(выделенный текст):'
	@read -p 'Нажмите ввод для списка макросов ...' proba
	@grep ^m4_define stdlib.m4|\
	cut -c 12-|\
	sed "s/',.*/()/"
site : $(html)
%.html : %.text $(rest) $(inc)
	./text2html $< > www/$@
upload: philon-arc.tgz
philon-arc.tgz: clean $(html)
	tar czf $@ -C www .
	$(scp)
lint : site
	linklint -textonly -doc errors /www/#
# вызов tidy с ключом -k
tidy : $(errs)
%.err: www/%.html
	tidy -raw -e -f errors/$@ $<
clean :
#	find ! -name weather.html -name \*\.html -o -name \*\~ -o -name \*\.inc|\
#	xargs rm -f
	rm www/*
	rm -f *.tgz
	rm -f www/*.err www/*.m4 www/*.css
	rm -rf errors/*
PHONY : site clean upload help check tidy
