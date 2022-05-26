pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/salim-dawod/laravel-php.git'
            }
        }
	stage('Build PHP docker image') {
            steps {
                sh 'docker build -t salimdawod1996/php-fpm:1.0 .'
            }
        }
    }
}

