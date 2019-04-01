pipeline {
	agent { label 'imagebuilder' }
	stages {
		stage('pull artifact') {
			steps {
				copyArtifacts filter: '*', fingerprintArtifacts: true, projectName: 'thunderclap-fpga-arria10', selector: specific('${BUILD_NUMBER}')
			}
		}

		stage ('Build') {
			steps {
				sh './build-thunderclap-sdcard.sh'
			}
		}
	}
}
