//所有的脚本命令都放在pipeline的
pipeline{
  //指定任务在哪个集群节点中执行
agent {
  kubernetes {
    cloud 'txy-kubernetes'
    namespace 'default'
    yaml '''apiVersion: v1
kind: Pod
metadata:
  labels:
    jenkins:worker
spec:
    container:
    - name:kaniko
      image:ubuntu'''
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

