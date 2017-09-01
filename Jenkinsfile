node {
 	// Clean workspace before doing anything
    deleteDir()

    try {
        stage ('Clone') {
        	checkout scm
        }
        stage ('Build') {
        	sh "cd /var/lib/jenkins/workspace/chef_cookbooks/lc_apache2 && foodcritic ."
        }
        stage ('Tests') {
	        parallel 'static': {
	            sh "cd /var/lib/jenkins/workspace/chef_cookbooks/lc_apache2 && chef exec rspec spec/"
	        },
	        'unit': {
	            sh "echo 'shell scripts to run unit tests...'"
	        },
	        'integration': {
	            sh "echo 'shell scripts to run integration tests...'"
	        }
        }
      	stage ('Deploy') {
            sh "echo 'shell scripts to deploy to server...'"
      	}
    } catch (err) {
        currentBuild.result = 'FAILED'
        throw err
    }
}

