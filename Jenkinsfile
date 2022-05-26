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
                    cat <<EOF > .env
                    APP_NAME = ${APP_NAME}
                    APP_ENV = ${APP_ENV}
                    APP_KEY = ${APP_KEY}
                    APP_DEBUG = ${APP_DEBUG}
                    APP_URL = ${APP_URL}
                    LOG_CHANNEL = ${LOG_CHANNEL}
                    LOG_DEPRECATIONS_CHANNEL = ${LOG_DEPRECATIONS_CHANNEL}
                    LOG_LEVEL = ${LOG_LEVEL}
                    DB_CONNECTION = ${DB_CONNECTION}
                    DB_HOST = ${DB_HOST}
                    DB_PORT = ${DB_PORT}
                    DB_DATABASE = ${DB_DATABASE}
                    DB_USERNAME = ${DB_USERNAME}
                    DB_PASSWORD = ${DB_PASSWORD}
                    EOF
                    docker build -t salimdawod1996/php-fpm:1.0 .
                '''
            }
        }
    }
}

