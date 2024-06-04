##
# Borderland Keep Project
#
# @file
# @version 0.1

dev: intermediate
	cp -r ./static ./tmp
	rm -r /var/www/html/*
	sed -i -f ./templates/nav.sed ./tmp/*.html
	sed -i -f ./templates/banner.sed ./tmp/*.html
	rsync -azP  ~/Projects/borderlandkeep.com/tmp/* /var/www/html/
	rm -r ./tmp

prod: intermediate
	sed -i -f ./templates/nav.sed ./tmp/*.html
	sed -i -f ./templates/banner.sed ./tmp/*.html
	mkdir ./tmp/static

deploy: prod
	rm -r /var/www/borderlandkeep.old
	mv /var/www/borderlandkeep.com /var/www/borderlandkeep.old
	rsync -azP  ~/borderlandkeep.com/tmp/* /var/www/borderlandkeep.com/
	rsync -azP  ~/website-static/* /var/www/borderlandkeep.com/static/
	rm -r ./tmp

intermediate:
	mkdir ./tmp
	cp *.html ./tmp
	cp -r ./css ./tmp

# end
