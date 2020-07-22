.PHONY: all
all: install bot

.PHONY: install
install:
	composer install

.PHONY: bot
bot:
	php examples/ding-dong-bot.php

.PHONY: clean
clean:
	rm -rf vendor/*

.PHONY: version
version:
	@newVersion=$$(awk -F. '{print $$1"."$$2"."$$3+1}' < VERSION) \
		&& echo $${newVersion} > VERSION \
		&& git add VERSION \
		&& git commit -m "$${newVersion}" > /dev/null \
		&& git tag "v$${newVersion}" \
		&& echo "Bumped version to $${newVersion}"
