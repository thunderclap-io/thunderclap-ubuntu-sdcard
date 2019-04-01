pipeline {
	agent { label 'imagebuilder' }
	stages {
		stage ('Build') {
			steps {
				sh './build-thunderclap-sdcard.sh'
			}
		}
	}
}
