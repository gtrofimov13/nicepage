pipeline {
    agent any
    stages {
        stage('Pre-Build') {
            steps {
                sh 'echo "Starting the script"'
                cleanWs()
                git branch: 'main', url: 'https://github.com/gtrofimov13/nicepage.git'
                sh '''
                    echo "Hello World!"
                    echo $PWD
                    ls -la
                    docker --version
                    docker ps
                    docker image ls
                    docker container ls -a
                '''
            }
        }
        stage('Build') {
            steps {
                sh'''
                    echo "Build"
                    docker-compose -f down
                    docker-compose -f docker-compose.yml build

                    '''
            }
        }
        stage('Test'){
            steps {
                sh '''
                    echo "Test"
                '''
            }
        }
        stage('Deploy') {
            steps {
               sh'''
                  echo "Deploying"
                  docker-compose up -d --no-deps --build static-homepage
                '''
            }
        }
    }
}
