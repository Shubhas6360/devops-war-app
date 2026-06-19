pipeline {
agent any


stages {

    stage('Build WAR') {
        steps {
            sh 'mvn clean package'
        }
    }

    stage('Trivy Scan') {
        steps {
            sh 'trivy fs .'
        }
    }

    stage('Build Docker Image') {
        steps {
            sh 'docker build -t webapp:1.0 .'
        }
    }

    stage('Run Container') {
        steps {
            sh '''
            docker rm -f webapp || true
            docker run -d -p 8081:8080 --name webapp webapp:1.0
            '''
        }
    }

}


}
