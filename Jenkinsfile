pipeline {
  agent {
    kubernetes {
      defaultContainer 'jenkins-slave'
      yamlFile 'jenkins-slave.yaml'
    }
  }
  stages {
    stage ('Initialize: Environment') {
      steps {
        script {
          if (env.GIT_BRANCH == 'prod') {
            stage ('Stage: Prod') {
                env.STAGE = 'prod'
                sh 'echo ${STAGE}'
            }
          } else if (env.GIT_BRANCH == 'dev') {
            stage ('Stage: Dev') {
                env.STAGE = 'dev'
                sh 'echo ${STAGE}'
            }  
          } else {
            stage ('Stage: Main') {
                env.STAGE = 'main'
                sh 'echo ${STAGE}'
            }
          }            
        }
      }
    }
    stage('Image build: WEB') {
      steps {
        dir('front') {
          sh 'make build'
        }
      }
    }
    stage('Image build: API') {
      steps {
        dir('back') {
          sh 'make build'
        }
      }
    }
    stage('Push to Repo') {
            parallel {
                stage('WEB-repo') {
                    steps {
                      dir('front') {
                        sh 'make push'
                      }
                    }
                }
                stage('API-repo') {
                    steps {
                        dir('back') {
                          sh 'make push'
                        }
                    }
                }
            }
        }
    stage('Deploy to the EKS cluster') {
            parallel {
                stage('WEB') {
                    steps {
                      dir('front') {
                        sh 'make deploy'
                      }
                    }
                }
                stage('API') {
                    steps {
                        dir('back') {
                          sh 'make deploy'
                        }
                    }
                }
            }
        }
      
  }
}