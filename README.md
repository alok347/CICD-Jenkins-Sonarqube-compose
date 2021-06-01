# CICD-Jenkins-Sonarqube-compose
This Branch contains CICD setup of jenkins and sonarqube on a go.

Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration. Compose works in all environments: production, staging, development, testing, as well as CI workflows.
Services: Docker service will be the image for a microservice within the context of some larger application. When you create a service, you specify which container image to use and which commands to execute inside running containers. You also define options for the service including
Image: Specify the image to start the container from. Can either be a repository/tag or a partial image ID. For example, image : Nginx: latest will start a container from Nginx's latest image.
Build Configuration options that are applied at build time.
Content: Either a path to a directory containing a Dockerfile, or a URL to a git repository.
Dockerfile: A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. Using docker build users can create an automated build that executes several command-line instructions in succession.
Network: Each container for a service joins the default network and is both reachable by other containers on that network, and discoverable by them at a hostname identical to the container name. Making a network is important since the Nginx must talk to other services (Jenkins and Sonarqube).
· Network driver bridge: Bridge networks are usually used when your applications run in standalone containers that need to communicate.
Container Name: Specify a custom container name, rather than a generated default name. If you do not specify, it will be the name of the file that your YAML file in.
Depends On: Express dependency between services. Sonarqube depends on Postgres DB in this work. If the service DB fails to start somehow, sonarqube would not be up as expected since it depends on the DB. Services are started according to the dependency order (i.e DB is started first.)
Environment: Using the Compose environment option allows us to declare environment variables and their values inside our Compose file. For instance, “JENKINS_OPTS= — prefix=/jenkins” is used to give a path to URL (localhost:<portNumber>/jenkins) .
Ports: In Docker, the containers themselves can have applications running on ports. When you run a container, if you want to access the application in the container via a port number, you need to map the port number of the container to the port number of the Docker host (HOST: CONTAINER).
Volumes: In order to be able to save (persist) data and also to share data between containers, Docker came up with the concept of volumes. If your volume configuration is wrong, you will see that, for instance, you are always redirected to the authentication page every time you start the Jenkins.
