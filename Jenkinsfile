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


  //声明全局变量,方便后面使用
  environment{
    key = 'value'
  }

  stages{
    stage("image build and push"){
      steps{
        container('kaniko') {
            sh '/kaniko/executor --context=git://github.com/wangmeng0812/wmhttp.git \
            -f `pwd`/Dockerfile -c `pwd`/src --cache=true \
            --destination=core.harbor.domain/wmhttp/my-nginx:tag \
                        --insecure \
                        --skip-tls-verify  \
                        -v=debug'
        }
      }
    }
}
