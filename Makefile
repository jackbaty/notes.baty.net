PUBLIC_DIR=public_html/
SERVER_HOST=static.baty.net
SERVER_DIR=/home/jbaty/apps/notes/public_html
#TARGET=netlify
#TARGET=digitalocean
TARGET=lightsail



deploy: commit push
	@echo "\033[0;32mDeploying updates to $(TARGET)...\033[0m"
	rsync -v -rz -e "ssh -i ~/.ssh/lightsail-us-east.pem" --checksum --delete --no-perms $(PUBLIC_DIR) $(SERVER_HOST):$(SERVER_DIR)

commit:
	git add -A
	git commit -m "Build site `date`"

push:
	git push origin master

clean:
	rm -rf $(PUBLIC_DIR)

.FORCE:
