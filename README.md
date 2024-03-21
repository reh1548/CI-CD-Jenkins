# Automated Flask Web App Deployment with Jenkins and Docker

## Overview

This project demonstrates the automation of building, testing, and deploying a Flask web application using Jenkins and Docker. The continuous integration and continuous deployment (CI/CD) pipeline is set up to automatically trigger whenever changes are pushed to the Git repository.

Thanks to: @mudasirhaji for his repo and detailed guide. 

## Changes Made
- Made it possible to view the webpage
- Fixed Flask and Werkzeug dependency bug
- Fixed build fail due to `COPY app/ .` file path and changed it to `COPY app/app.py .`

## Project Structure

The project consists of the following components:

1. **Dockerfile**: Contains instructions to build a Docker image for the Flask web application.
2. **Jenkinsfile**: Defines the Jenkins pipeline stages for building, testing, and deploying the Flask app.
3. **app.py**: Main Python file containing the Flask application code.
4. **tests/**: Directory containing test files for the Flask application.
5. **requirements.txt**: File listing the Python dependencies required by the Flask app.

## Technologies Used

- Python: Programming language used to develop the Flask web application.
- Flask: Micro web framework used for building the web application.
- Docker: Containerization platform used to package and deploy the Flask app.
- Jenkins: Automation server used to implement the CI/CD pipeline.
- GitHub: Version control system used to host the project repository.

## CI/CD Pipeline Workflow

1. **Build**: Jenkins pulls the latest code from the Git repository and builds a Docker image using the provided Dockerfile.
2. **Test**: Jenkins runs the automated tests using pytest to ensure the Flask application functions correctly.
3. **Deploy**: Jenkins pushes the built Docker image to Docker Hub after successful testing. It then stops and removes any existing Docker container with the same name, and finally starts a new Docker container with the latest image, exposing it on port 80.

## Dependencies

- Python 3.9 or higher
- Docker
- Jenkins
- Flask
- pytest
