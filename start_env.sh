# Start a local development jenkins environment based on docker

JENKINS_CONTAINER_NAME="jenkins-local"
JENKINS_IMAGE_NAME="ownjenkins"
JENKINS_IMAGE_VERSION="latest"

# Build image

if [ "$1" == "dev" ];then
	if [ "$2" == "--build" ];then
		echo "Building Jenkins image..."
		docker build -t $JENKINS_IMAGE_NAME:$JENKINS_IMAGE_VERSION .
	fi
	echo "Starting Jenkins"
	docker network create -d bridge dev
	# Start jenkins
	docker stop $JENKINS_CONTAINER_NAME
    docker rm $JENKINS_CONTAINER_NAME
    docker container run -d  -p 8080:8080  --net=dev  -v jenkinsvol:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --name $JENKINS_CONTAINER_NAME  $JENKINS_IMAGE_NAME:$JENKINS_IMAGE_VERSION


	docker ps

elif [ "$1" == "prod" ];then
	if [ "$2" == "--build" ];then
        break;
		#echo "Building image (using proxy:10.243.230.12:8080)..."
		#docker build --build-arg http_proxy=http://10.243.230.12:8080 --build-arg https_proxy=http://10.243.230.12:8080 -t datalab-middleware:latest middleware/
	fi

	break;


fi

