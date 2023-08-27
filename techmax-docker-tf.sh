# create a repository to store the docker image in docker hub

# launch an ec2 instance. open port 80 and port 22

# install and configure docker on the ec2 instance
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
docker info

# create a dockerfile
sudo vi Dockerfile 

# build the docker image
docker build -t naren-techmax .

# login to your docker hub account
#docker login --username narian318
cat ~/my-dhub-password.txt | sudo docker login --username narian318 --password-stdin

# use the docker tag command to give the image a new name
docker tag naren-techmax narian318/naren-techmax

# push the image to your docker hub repository
docker push narian318/naren-techmax

# start the container to test the image 
docker run -dp 80:80 -t techmax-container narian318/naren-techmax