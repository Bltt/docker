.PHONY = add commit push

CONTAINER_NAME = jenkins

add:	
	@git add .

commit: add
	@git commit -m "Latest commit via makefile"

push: commit
	@git push origin master

create_jenkins:
	@docker run --name ${CONTAINER_NAME} -d -p 8080:8080 jenkins:alpine

get_jenkins_password:
	@docker logs ${CONTAINER_NAME} | grep "password to proceed to installation:" -A1 | tail -n 1

stop_jenkins:
	@docker stop ${CONTAINER_NAME}

destroy_jenkins: stop_jenkins
	@docker rm ${CONTAINER_NAME}
