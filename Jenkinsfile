pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/salim-dawod/laravel-php.git'
            }
        }
        stage('Build PHP docker image') {
            environment {
                APP_NAME = "laravel"
                APP_ENV = "local"
                APP_KEY = ""
                APP_DEBUG = "true"
                APP_URL = "http://localhost"
                LOG_CHANNEL = "stack"
                LOG_DEPRECATIONS_CHANNEL = "null"
                LOG_LEVEL = "debug"
                DB_CONNECTION = "mysql"
                DB_HOST = "db"
                DB_PORT = "3306"
                DB_DATABASE = "laravel_db"
                DB_USERNAME = "salim"
                DB_PASSWORD = credentials('database_password')
            }

            steps {
                sh '''
                    echo "APP_NAME = ${APP_NAME}" > .env
                    echo "APP_ENV = ${APP_ENV}" >> .env
                    echo "APP_KEY = ${APP_KEY}" >> .env
                    echo "APP_DEBUG = ${APP_DEBUG}" >> .env
                    echo "APP_URL = ${APP_URL}" >> .env
                    echo "LOG_CHANNEL = ${LOG_CHANNEL}" >> .env
                    echo "LOG_DEPRECATIONS_CHANNEL = ${LOG_DEPRECATIONS_CHANNEL}" >> .env
                    echo "LOG_LEVEL = ${LOG_LEVEL}" >> .env
                    echo "DB_CONNECTION = ${DB_CONNECTION}" >> .env
                    echo "DB_HOST = ${DB_HOST}" >> .env
                    echo "DB_PORT = ${DB_PORT}" >> .env
                    echo "DB_DATABASE = ${DB_DATABASE}" >> .env
                    echo "DB_USERNAME = ${DB_USERNAME}" >> .env
                    echo "DB_PASSWORD = ${DB_PASSWORD}" >> .env
                    docker build -t salimdawod1996/php-fpm:1.0 .
                '''
            }
        }
    }
}

