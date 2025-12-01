pipeline {
    agent any

    tools {
        maven 'MAVEN-3.9'
        jdk 'JDK21'
    }

    environment {
        TOMCAT_HOME = 'C:\\Users\\hp\\Downloads\\apache-tomcat-9.0.112-windows-x64\\apache-tomcat-9.0.112'
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    credentialsId: 'github-hotel-token',
                    url: 'https://github.com/Akshay-e1/hotel.git'
            }
        }

        stage('Build WAR') {
            steps {
                bat "mvn clean package -DskipTests"
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                echo "🔴 Stopping Tomcat..."
                bat "\"%TOMCAT_HOME%\\bin\\shutdown.bat\""

                echo "📦 Deploying WAR..."
                bat "copy /Y target\\hotel.war \"%TOMCAT_HOME%\\webapps\\hotel.war\""

                echo "🟢 Starting Tomcat..."
                bat "\"%TOMCAT_HOME%\\bin\\startup.bat\""
            }
        }
    }

    post {
        success {
            echo "🎉 Deployment successful!"
        }
        failure {
            echo "❌ Deployment failed. Check Jenkins Console Output."
        }
    }
}
