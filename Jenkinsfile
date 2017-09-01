node {
 	// Clean workspace before doing anything
    deleteDir()

    try {
        stage ('Clone') {
        	checkout scm
        }
        stage ('SCA') {
	    sh "cd /var/lib/jenkins/workspace/chef_cookbooks/lc_apache2 && foodcritic ."
	}
      	stage ('Unit Test') {
            sh "cd /var/lib/jenkins/workspace/chef_cookbooks/lc_apache2 && chef exec rspec spec/"
      	}

        stage ('Integration Test') {
            sh "cd /var/lib/jenkins/workspace/chef_cookbooks/lc_apache2 && kitchen verify"
        }
    } catch (err) {
        currentBuild.result = 'FAILED'
        throw err
    }
}

