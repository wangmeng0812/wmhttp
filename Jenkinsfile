//所有的脚本命令都放在pipeline中
pipeline{
  //指定任务在哪个集群节点中执行
  agent any

  //声明全局变量,方便后面使用
  environment{
    key = 'value'
  }

  stages{
    stage("拉取git仓库代码"){
      steps{
        git 'https://github.com/wangmeng0812/wmhttp.git'
      }
    }
    stage("通过maven构建项目"){
      steps{
        echo '通过maven构建项目 - success'
      }
    }
    stage("通过SonarQube做代码质量检测"){
      steps{
        echo '通过SonarQube做代码质量检测 - success'
      }
    }
    stage("通过Docker制作自定义镜像"){
      steps{
        echo '通过Docker制作自定义镜像 - success'
      }
    }
    stage("将自定义镜像推送到Harbor"){
      steps{
        echo '将自定义镜像推送到Harbor - success'
      }
    }
    stage("通过Publish over SSH通知目标服务器"){
      steps{
        echo '通过Publish over SSH通知目标服务器 - success'
      }
    }

  }
}
