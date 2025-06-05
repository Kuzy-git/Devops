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
    }
}
