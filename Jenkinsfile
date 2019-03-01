pipeline {
    agent {
        docker {
            image "ruby"
        }
    }
    stages {
        stage("Build") {
            steps {
              sh "bundle install"
            }
       
        }
        stage("Run Tests") {
            steps {
        sh "bundle exec cucumber -t @smoke"
            }
            
         }
     }
 }

