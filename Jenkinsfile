//所有的脚本命令都放在pipeline的
pipeline{
  //指定任务在哪个集群节点中执行
agent {
  kubernetes {
    cloud 'txy-kubernetes'
    namespace 'default'
    yaml '''
    apiVersion: v1
    kind: Pod
    metadata:
      labels:
        name: ubuntu
      name: ubuntu-0
    spec:
      containers:
      - image: ubuntu
        name: ubuntu
        command: ["/bin/sh","-c","sleep 9999"]
     '''
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

