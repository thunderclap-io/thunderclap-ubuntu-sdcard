pipeline {
	agent { label 'imagebuilder' }
	options { buildDiscarder(logRotator(numToKeepStr: '1')) }
	stages {
		stage('Pull artifacts') {
			steps {
				copyArtifacts filter: '**', fingerprintArtifacts: true, projectName: 'thunderclap-fpga-arria10/master'
				copyArtifacts filter: '**', fingerprintArtifacts: true, projectName: 'thunderclap-qemu/master'
			}
		}

		stage ('Build') {
			steps {
				sh '''#!/bin/bash
				      source $SOCEDS_DEST_ROOT/env.sh && ./build_thunderclap_ubuntu.sh
				'''
			}
		}
	}
	post {
		always {
			archiveArtifacts artifacts: "sdimage.img.xz", fingerprint:true 
		}
	}
}
