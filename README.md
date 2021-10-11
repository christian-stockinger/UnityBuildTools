# UnityBuildTools
[![GitHub Release](https://img.shields.io/github/v/tag/christian-stockinger/UnityBuildTools.svg?label=version)](https://github.com/christian-stockinger/UnityBuildTools/releases)

CI scripts to get license activation files, execute builds and tests.

## Requirements

The scripts require the following tools to be available:

- curl
- unzip

## Recommended docker images

The scripts have been tested and work best with docker images from [unityci](https://hub.docker.com/u/unityci).

## Scripts

There are different scripts available, listed below to copy&paste into your pipeline.

Make sure to replace `${BUILD_TOOLS_VERSION}` with a valid tag or set it via env variable.
For available releases please see [the releases page](https://github.com/christian-stockinger/UnityBuildTools/releases).

### Setup everything for CI builds

```sh
curl https://github.com/christian-stockinger/UnityBuildTools/releases/download/${BUILD_TOOLS_VERSION}/UnityBuildTools.zip -L --output UnityBuildFiles.zip && unzip UnityBuildFiles.zip
chmod +x ./ci/before_script.sh && ./ci/before_script.sh
chmod +x ${HOME}/.local/share/unity3d/Unity/Unity_lic.ulf
```

### Get the activation file

```sh
curl https://github.com/christian-stockinger/UnityBuildTools/releases/download/${BUILD_TOOLS_VERSION}/UnityBuildTools.zip -L --output UnityBuildFiles.zip && unzip UnityBuildFiles.zip
chmod +x ./ci/get_activation_file.sh && ./ci/get_activation_file.sh
```

### Execute the build process

```sh
curl https://github.com/christian-stockinger/UnityBuildTools/releases/download/${BUILD_TOOLS_VERSION}/UnityBuildTools.zip -L --output UnityBuildFiles.zip && unzip UnityBuildFiles.zip
chmod +x ./ci/build.sh && ./ci/build.sh
```

## More details

You want more details? Please take a look at the blog post [From Unity Code to App](https://blog.timo-reymann.de/from-unity-code-to-app/).
