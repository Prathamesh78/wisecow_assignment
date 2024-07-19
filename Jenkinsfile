pipeline {
    agent { label 'slave1' }	

	environment {	
		DOCKERHUB_CREDENTIALS=credentials('dockerloginid')
	} 
    
    stages {
        stage('SCM Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Prathamesh78/wisecow_assignment.git'
            }
		}
		
        stage("Docker build"){
            steps {
    			sh 'docker version'
        		sh "docker build -t prathamesh78/wisecow:${BUILD_NUMBER} ."
    			sh 'docker image list'
    			sh "docker tag prathamesh78/wisecow:${BUILD_NUMBER} prathamesh78/wisecow:latest"
            }
        }
        
    	stage('Login2DockerHub') {
    		steps {
    			sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
    		}
    	}
    	
    	stage('Push2DockerHub') {
    		steps {
    			sh "docker push prathamesh78/wisecow:latest"
    		}
    	}
    	
    	stage('Deploy to Kubernetes Environment') {
            steps {
		        script {
                    sshPublisher(publishers: [sshPublisherDesc(configName: 'Kubernetes_cluster', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'kubectl apply -f kubernetesdeploy.yaml', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '.', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'kubernetesdeploy.yaml')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
		        }
         }
    	}    
    }
}
