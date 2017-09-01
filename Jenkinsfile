node {
 	// Clean workspace before doing anything
    deleteDir()

    try {
        stage ('Clone') {
        	checkout scm
        }
        stage ('Tests') {
	        parallel 'static': {
	            sh "cd /var/lib/jenkins/workspace/chef_cookbooks/lc_apache2 && foodcritic ."
	        },
	        'unit': {
	            sh "cd /var/lib/jenkins/workspace/chef_cookbooks/lc_apache2 && chef exec rspec spec/"
	        },
	        'integration': {
	            sh "cd /var/lib/jenkins/workspace/chef_cookbooks/lc_apache2 && kitchen verify"
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

