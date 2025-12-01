pipeline {
    agent any

    tools {
        maven 'MAVEN-3.9'      // from Global Tool Configuration
        jdk 'JDK21'            // from Global Tool Configuration
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
                echo "Stopping Tomcat..."
                bat '"C:\\apache-tomcat-9.0.112\\bin\\shutdown.bat"'
                bat 'timeout /t 5'      // wait 5 sec for safe shutdown

                echo "Copying WAR to Tomcat webapps..."
                bat 'copy /Y target\\hotel.war C:\\apache-tomcat-9.0.112\\webapps\\hotel.war'

                echo "Starting Tomcat..."
                bat '"C:\\apache-tomcat-9.0.112\\bin\\startup.bat"'
                bat 'timeout /t 3'      // allow Tomcat to boot
            }
        }
    }

    post {
        success {
            echo "🚀 Deployment Successful! Visit: http://localhost:8080/hotel"
        }
        failure {
            echo "❌ Deployment Failed. Check logs."
        }
    }
}
