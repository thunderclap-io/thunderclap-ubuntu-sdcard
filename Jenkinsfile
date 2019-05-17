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

		stage ('Build Intel A10 SoC devkit') {
			steps {
				sh '''#!/bin/bash
				      source $SOCEDS_DEST_ROOT/env.sh && ./build_thunderclap_ubuntu.sh intel-a10soc-devkit
				      mv sdimage.img.xz a10socdevkit-sd.img.xz
				'''
			}
		}
		stage ('Build Enclustra AA1/PE1') {
			steps {
				sh '''#!/bin/bash
				      source $SOCEDS_DEST_ROOT/env.sh && ./build_thunderclap_ubuntu.sh enclustra-mercury-aa1-pe1
				      mv sdimage.img.xz enclustra-sd.img.xz
				'''
			}
		}


	}
	post {
		always {
			archiveArtifacts artifacts: "*-sd.img.xz", fingerprint:true 
		}
	}
}
