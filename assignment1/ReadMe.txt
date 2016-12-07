Commad to be run

For build the image go to the place where Dockerfile placed and run  
#docker build .

Run docker container

#docker run  --rm=true -t -i -p 7080:8080 --name container_name Image_id

then check on host machine browser with 

http://localhost:7080

user name : admin
pass : tomcat