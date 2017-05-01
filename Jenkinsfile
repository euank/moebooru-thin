#!groovy

properties([
    buildDiscarder(logRotator(daysToKeepStr: '20', numToKeepStr: '30')),

    pipelineTriggers([
      pollSCM('H/5 * * * *')
    ])
])

node('docker') {
  stage('SCM') {
    checkout scm
  }

  stage('Push') {
    withCredentials([usernamePassword(credentialsId: 'quay-moebooru', 
          passwordVariable: 'DOCKER_PASS', 
          usernameVariable: 'DOCKER_USER')]) {

      sh '''#!/bin/bash -ex
        export HOME=${WORKSPACE}
        docker login --username "${DOCKER_USER}" --password "${DOCKER_PASS}" quay.io

        REPO=quay.io/euank/moebooru:$(git rev-parse --short HEAD)
        docker build -t "${REPO}" .
        docker push "${REPO}"
      '''
    }
  }
}
