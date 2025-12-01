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
                echo "⚙️ Stopping Tomcat..."
                bat "\"%TOMCAT_HOME%\\bin\\shutdown.bat\""

                echo "🗑 Deleting old exploded app folder..."
                bat "rmdir /S /Q \"%TOMCAT_HOME%\\webapps\\hotel\""

                echo "📂 Deleting old WAR file..."
                bat "del /F /Q \"%TOMCAT_HOME%\\webapps\\hotel.war\""

                echo "📦 Copying new WAR..."
                bat "copy /Y target\\hotel.war \"%TOMCAT_HOME%\\webapps\\hotel.war\""

                echo "🚀 Starting Tomcat..."
                bat "\"%TOMCAT_HOME%\\bin\\startup.bat\""
            }
        }
    }

    post {
        success {
            echo "🎉 Deployment successful!"
        }
        failure {
            echo "❌ Deployment failed!"
        }
    }
}
