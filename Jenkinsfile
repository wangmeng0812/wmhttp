pipeline {
  agent {
    kubernetes {
      yaml '''
apiVersion: v1
kind: Pod
metadata:
  labels:
    jenkins: worker
spec:
    container:
    - name:kaniko
      image:gcr.io/kaniko-project/executor:debug
      command:
      -sleep
      args:
      - 99999
      tty: true
      volumeMounts:
         - name: docker-secret
           mountPath: /kaniko/.docker
           readOnly: true
    volumes:
    - name: docker-secret
      secret:
        secretName: docker-secret
'''
    }

  }
  stages {
    stage('image build and push') {
      steps {
        container(name: 'kaniko') {
          sh '/kaniko/executor -f `pwd`/Dockerfile -c `pwd`/src --cache=true             --destination=core.harbor.domain/wmhttp/my-nginx:tag                         --insecure                         --skip-tls-verify                          -v=debug'
        }

      }
    }

  }
  environment {
    key = 'value'
  }
}