alias "wtf"='docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi $(docker images -f dangling=true -q)'
alias "WTF"='docker stop $(docker ps -a -q); docker network prune -f; ! docker rm $(docker ps -a -q); docker volume rm $(docker volume ls -f dangling=true -q); docker rmi $(docker images -f dangling=true -q); docker rmi $(docker images -a -q) -f'