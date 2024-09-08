.DEFAULT_GOAL := dev

dev:
	RAILS_ENV=development foreman start -f Procfile.dev
.PHONY: dev

server:
	@rails s
.PHONY: server

test:
	bundle exec rspec ${SPEC}
.PHONY: test

migrate:
	rails db:migrate
.PHONY: migrate

dc: dc.db dc.redis
.PHONY: dc

dc.db:
	docker compose up -d postgres
.PHONY: dc.db

dc.redis:
	docker compose up -d redis
.PHONY: dc.redis

db:
	rails db:create db:migrate db:seed
.PHONY: db

deps: deps.ruby deps.node
.PHONY: deps

deps.ruby:
	bundle
.PHONY: deps.ruby

deps.node:
	yarn
.PHONY: deps.node

assets:
	@yarn build
	@yarn build:css
	rails assets:precompile
.PHONY: assets

front: front.build front.css
.PHONY: front

front.build:
	yarn build
.PHONY: front.build

front.css:
  yarn build:css
.PHONY: front.css

lint: lint.front lint.ruby
.PHONY: lint

lint.front:
	yarn lint:fix
.PHONY: lint.front

lint.ruby:
	bundle exec rubocop -A
.PHONY: lint.ruby

console:
	rails console
.PHONY: console

dc.mailcatcher:
	docker compose up -d mailcatcher
.PHONY: dc.mailcatcher

workers: dc.redis dc.mailcatcher
.PHONY: workers

worker: dc.redis dc.mailcatcher
	bundle exec sidekiq -C config/sidekiq.yml
.PHONY: worker

down:
	@docker compose down
.PHONY: down

web.open:
	@ngrok http --domain=moral-polecat-content.ngrok-free.app 8000
.PHONY:web.open

docker.build: docker.image
.PHONY: docker.build

docker.image:
	@ ${ARGS} docker build \
		--build-arg DATABASE_URL=${${DATABASE_URL} : "postgresql://docker:docker@host.docker.internal:5443/javelindb"} \
		--build-arg REDIS_URL=${${REDIS_URL} : "redis://host.docker.internal:6379"} \
		--build-arg RAILS_LOG_TO_STDOUT=${RAILS_LOG_TO_STDOUT} \
		--build-arg SPRINT_SECRET=${SPRINT_SECRET} \
		--build-arg SPRINT_CLIENT_ID=${SPRINT_CLIENT_ID} \
		-t bvu-dashboard-app .
.PHONY: docker.image

prod: docker.image prod.up
.PHONY: prod

prod.up:
	docker kill bvu-app || true
	docker run --rm --name bvu-app -p 3000:3000 -p 443:443 bvu-dashboard-app
.PHONY: prod.up
