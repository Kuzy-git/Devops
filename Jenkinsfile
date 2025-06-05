pipeline {
    agent any

    stages {
        stage('Disk Usage') {
            steps {
                echo '=== Disk Usage ==='
                sh 'df -h'
            }
        }

        stage('Top Memory-Consuming Process') {
            steps {
                echo '=== Process Using Most Memory ==='
                sh '''
                    echo "PID | %MEM | COMMAND"
                    ps -eo pid,%mem,comm --sort=-%mem | head -n 2
                '''
            }
        }
        
        stage('Build and Run') {
            steps {
                sh 'docker-compose up -d --build'
            }
        }
        
        stage('Check Services') {
            steps {
                sh 'docker-compose ps'
                sh 'curl -f http://localhost:8080 || exit 1'
            }
        }        
    }
}
