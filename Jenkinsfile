pipeline {
  agent any

  environment {
    DOCKER_IMAGE_NAME = 'my-flask-app'
    DOCKER_CONTAINER_NAME = 'my-flask-container'
    CONTAINER_PORT = 5000
    HOST_PORT = 80  // Change to desired host port if not using random
  }

  stages {
    stage('Build') {
      steps {
        sh 'docker build -t my-flask-app .'
        sh 'docker tag my-flask-app $DOCKER_IMAGE_NAME'
      }
    }
    stage('Test') {
      steps {
        sh 'docker run my-flask-app python -m pytest app/tests/'
      }
    }
    stage('Deploy') {
      steps {
        withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
          sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io"
          sh 'docker push $DOCKER_BFLASK_IMAGE'

          // Stop any container using port 5000 before deployment
          sh 'docker stop $(docker ps -q --filter "expose=5000") || true'  // Graceful stop with error handling

          // Run the container with desired port mapping
          sh "docker run -d -p ${HOST_PORT}:${CONTAINER_PORT} --name $DOCKER_CONTAINER_NAME $DOCKER_IMAGE_NAME"
        }
      }
    }
  }

  post {
    always {
      sh 'docker logout'
    }
  }
}

