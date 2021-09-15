#!/usr/bin/env bash

set -e
mkdir -p /root/.cache/unity3d
mkdir -p /root/.local/share/unity3d/Unity/

UPPERCASE_BUILD_TARGET=${BUILD_TARGET};


if [ -z $ANDROID_KEYSTORE_BASE64 ]
then
    echo "ANDROID_KEYSTORE_BASE64....... NOT FOUND"
    echo " building with Unity's default debug keystore"
else
    echo "ANDROID_KEYSTORE_BASE64....... FOUND"
    echo '$ANDROID_KEYSTORE_BASE64 found, decoding content into keystore.keystore'
    echo $ANDROID_KEYSTORE_BASE64 | base64 --decode > keystore.keystore
fi

FAIL=false

echo "---- Checking Environment Variables"
if [ -z "$UNITY_PASSWORD" ]
then
	echo "UNITY_PASSWORD....... NOT FOUND"
	FAIL=true
else
	echo "UNITY_PASSWORD....... FOUND"
fi

if [ -z "$UNITY_USERNAME" ]
then
	echo "UNITY_USERNAME....... NOT FOUND"
	FAIL=true
else
	echo "UNITY_USERNAME....... FOUND"
fi

if [ -z "$UNITY_LICENSE_CONTENT" ]
then
	echo "UNITY_LICENSE_CONTENT....... NOT FOUND"
	FAIL=true
else
	echo "UNITY_LICENSE_CONTENT....... FOUND"
fi

# check if the all Environment Variable set Correctly
if [ $FAIL = true ]
then
	exit 1
fi

echo "$UNITY_LICENSE_CONTENT" | tr -d '\r' > /root/.local/share/unity3d/Unity/Unity_lic.ulf
