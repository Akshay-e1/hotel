pipeline {
    agent any

    tools {
        maven 'MAVEN-3.9'
        jdk 'JDK21'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Akshay-e1/hotel.git',
                    credentialsId: 'github-hotel-token'
            }
        }

        stage('Build WAR') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Deploy to Tomcat (Windows)') {
            steps {
                echo "Copying WAR to Tomcat..."

                // STOP TOMCAT
                bat '"C:\\apache-tomcat-9.0.112\\bin\\shutdown.bat"'

                // COPY WAR FILE TO WEBAPPS
                bat 'copy /Y target\\hotel.war C:\\apache-tomcat-9.0.112\\webapps\\hotel.war'

                // START TOMCAT
                bat '"C:\\apache-tomcat-9.0.112\\bin\\startup.bat"'
            }
        }
    }

    post {
        success {
            echo "Deployment successful!"
        }
        failure {
            echo "Deployment failed!"
        }
    }
}
