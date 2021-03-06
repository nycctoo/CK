#!/bin/bash

export KERNELNAME="CK"

export LOCALVERSION=0.2

export KBUILD_BUILD_USER=Peter

export KBUILD_BUILD_HOST=DroneCI

export TOOLCHAIN=clang

export DEVICES=whyred

source helper

gen_toolchain

send_msg "Start building ${KERNELNAME} ${LOCALVERSION} for ${DEVICES}..."

send_msg "Starting building stock version..."

START=$(date +"%s")

for i in ${DEVICES//,/ }
do
	build ${i} -oldcam -stock

	build ${i} -newcam -stock
done

END=$(date +"%s")

DIFF=$(( END - START ))

send_msg "Build succesfully in $((DIFF / 60))m $((DIFF % 60))s"
