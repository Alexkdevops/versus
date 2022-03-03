pipeline {
  agent {
    kubernetes {
      defaultContainer 'jenkins-slave'
      yamlFile 'jenkins-slave.yaml'
    }
  }
  stages {
    stage ('Environment') {
      steps {
        script {
          if (env.GIT_BRANCH == 'main') {
            stage ('Stage: Main') {
                env.STAGE = 'main'
                sh 'echo ${STAGE}'
            }
          } else if (env.GIT_BRANCH == 'dev') {
            stage ('Stage: Dev') {
                env.STAGE = 'dev'
                sh 'echo ${STAGE}'
            }  
          } else if (env.GIT_BRANCH == 'prod') {
            stage ('Stage: Prod') {
                env.STAGE = 'prod'
                sh 'echo ${STAGE}'
            }
          }            
        }
      }
    }
    stage('Image: WEB') {
      steps {
        dir('frontend') {
          sh 'make build'
        }
      }
    }
    stage('Image: API') {
      steps {
        dir('backend') {
          sh 'make build'
        }
      }
    }
    stage('Repo') {
            parallel {
                stage('WEB-repo') {
                    steps {
                      dir('frontend') {
                        sh 'make push'
                      }
                    }
                }
                stage('API-repo') {
                    steps {
                        dir('backend') {
                          sh 'make push'
                        }
                    }
                }
            }
        }
    stage('Deployment:') {
            parallel {
                stage('WEB') {
                    steps {
                      dir('frontend') {
                        sh 'make deploy'
                      }
                    }
                }
                stage('API') {
                    steps {
                        dir('backend') {
                          sh 'make deploy'
                        }
                    }
                }
            }
        }
      
  }
}