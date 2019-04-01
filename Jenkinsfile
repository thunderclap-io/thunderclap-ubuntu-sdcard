pipeline {
	agent { label 'imagebuilder' }
	stages {
		stage('Pull artifacts') {
			steps {
				copyArtifacts filter: '**', fingerprintArtifacts: true, projectName: 'thunderclap-fpga-arria10/master'
			}
		}

		stage ('Build') {
			steps {
				sh 'source $SOCEDS_DEST_ROOT/env.sh && ./build_thunderclap_ubuntu.sh'
			}
		}
	}
}
