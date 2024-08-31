up:
	docker-compose up -d

stop:
	docker-compose stop

bash:
	docker exec -it app-invitation-manager /bin/bash

server: remove_pid
	docker exec app-invitation-manager bundle exec rails s -p 3000 -b 0.0.0.0

remove_pid:
	docker exec app-invitation-manager rm -f tmp/pids/server.pid