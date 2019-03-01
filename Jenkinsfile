pipeline {
    agent {
        docker {
            image "ruby"
        }
    }
    stages {
        stage("Build") {
            sh "bundle install"
        }
        stage("Run Tests") {
            sh "bundle exec cucumber -t @smoke"
        }
    }
}