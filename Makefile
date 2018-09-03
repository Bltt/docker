.PHONY = add commit push

add:	
	@git add .

commit: add
	@git commit -m "Latest commit via makefile"

push: commit
	@git push origin master
