//所有的脚本命令都放在pipeline的
pipeline{
  //指定任务在哪个集群节点中执行
agent {
        kubernetes {
          cloud 'kubernetes'
          inheritFrom 'jnlp-slave'
        }
      }


  stages{
    stage("image build and push"){
      steps{
      container('jnlp-slave') {
       echo "hello"
       }
        }
      }
    }
  }

