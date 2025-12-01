pipeline {
    agent any

    tools {
        maven 'MAVEN-3.9'   // name you configured in Jenkins → Global Tool config
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

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                sshPublisher(
                    publishers: [
                        sshPublisherDesc(
                            configName: 'tomcat-server',
                            transfers: [
                                sshTransfer(
                                    sourceFiles: 'target/hotel.war',
                                    remoteDirectory: '/opt/tomcat/webapps/',
                                    removePrefix: '',
                                    execCommand: ''
                                )
                            ],
                            verbose: true
                        )
                    ]
                )
            }
        }
    }

    post {
        always {
            echo "Pipeline finished."
        }
    }
}
