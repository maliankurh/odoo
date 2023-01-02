pipeline {
  agent {
    kubernetes {
      yaml '''
        apiVersion: v1
        kind: Pod
        spec:
          containers:
          - name: docker
            image: docker:latest
            command:
            - cat
            tty: true
            volumeMounts:
             - mountPath: /var/run/docker.sock
               name: docker-sock
          volumes:
          - name: docker-sock
            hostPath:
              path: /var/run/docker.sock    
        '''
    }
  }
  stages {
    stage('Clone') {
      steps {
        container('maven') {
          git branch: 'main', changelog: false, poll: false, url: 'https://github.com/maliankurh/odoo.git'
        }
      }
    }  
    stage('Build-Docker-Image') {
      steps {
        container('docker') {
          sh 'docker build -t ss69261/testing-image:latest .'
        }
      }
    }
  }
}
