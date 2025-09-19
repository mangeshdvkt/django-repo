pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/mangeshdvkt/django-repo.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'python3 -m venv venv'
                sh './venv/bin/pip install --upgrade pip'
                sh './venv/bin/pip install -r requirements.txt'
            }
        }

        stage('Run Migrations') {
            steps {
                sh './venv/bin/python manage.py migrate'
            }
        }

        stage('Run Tests') {
            steps {
                sh './venv/bin/python manage.py test'
            }
        }

        stage('Start Django Server') {
            steps {
                sh './venv/bin/gunicorn deployDj.wsgi:application --bind 0.0.0.0:8000 &'
            }
        }
    }
}
