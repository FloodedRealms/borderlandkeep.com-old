##
# Borderland Keep Project
#
# @file
# @version 0.1

dev: intermediate
	rm -r /var/www/html/*
	sed -i -f ./templates/nav.sed ./tmp/*.html
	sed -i -f ./templates/banner.sed ./tmp/*.html
	rsync -azP  ~/Projects/borderlandkeep.com/tmp/* /var/www/html/
	rm -r ./tmp

intermediate:
	mkdir ./tmp
	cp *.html ./tmp
	cp -r ./css ./tmp
	cp -r ./static ./tmp

# end
