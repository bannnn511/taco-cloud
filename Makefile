up:
	docker compose up
down:
	docker compose down --volumes
clean-image:
	docker image rm -f taco-cloud-backend
set-dev-env:
	export SPRING_PROFILES_ACTIVE=dev