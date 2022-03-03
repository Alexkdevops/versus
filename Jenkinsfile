pipeline {
  agent {
    kubernetes {
      defaultContainer 'jenkins-slave'
      yamlFile 'jenkins-slave.yaml'
    }
  }
  // environment {
  //   MYSQL_USER     = credentials('MYSQL_USER')
  //   MYSQL_PASSWORD = credentials('MYSQL_PASSWORD')
  // }
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
    // stage('Image: WEB') {
    //   steps {
    //     dir('front') {
    //       sh 'make build'
    //     }
    //   }
    // }
    // stage('Image: API') {
    //   steps {
    //     dir('back') {
    //       sh 'make build'
    //     }
    //   }
    // }
    // stage('Repo') {
    //         parallel {
    //             stage('WEB-repo') {
    //                 steps {
    //                   dir('front') {
    //                     sh 'make push'
    //                   }
    //                 }
    //             }
    //             stage('API-repo') {
    //                 steps {
    //                     dir('back') {
    //                       sh 'make push'
    //                     }
    //                 }
    //             }
    //         }
    //     }
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