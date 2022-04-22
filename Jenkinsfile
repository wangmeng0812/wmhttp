//所有的脚本命令都放在pipeline的
pipeline{
  //指定任务在哪个集群节点中执行
agent {
  kubernetes {
    cloud 'kubernetes'
    inheritFrom 'jnlp-slave'
    namespace 'default'
    yaml '''apiVersion: v1
kind: Pod
metadata:
  labels:
    jenkins:worker
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
        secretName: harbor-secret'''
  }
}

  stages{
    stage("image build and push"){
      steps{
      container('kaniko') {
       echo "hello"
       }
        }
      }
    }
  }

