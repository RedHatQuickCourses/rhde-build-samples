#!/bin/bash

#IMAGES_DIRECTORY=~/content.example.com/rhde/oci/
IMAGES_DIRECTORY=~/
IMAGE_PULL_FILE=~/mirror-pull-secret
IMAGE_LOCAL_DIR=$IMAGES_DIRECTORY/app-containers
TARGET_REGISTRY=servera.lab.example.com:8443

pushd "${IMAGE_LOCAL_DIR}" >/dev/null
while read -r src_manifest ; do
   # Remove the manifest.json file name
   src_img=$(dirname "${src_manifest}")
   # Add the target registry prefix and remove SHA
   dst_img="${TARGET_REGISTRY}/${src_img}"
   dst_img=$(echo "${dst_img}" | awk -F'@' '{print $1}')

   # Run the image upload command
   echo "Uploading '${src_img}' to '${dst_img}'"
   skopeo copy --all --quiet \
      --preserve-digests \
      --authfile "${IMAGE_PULL_FILE}" \
      dir://"${IMAGE_LOCAL_DIR}/${src_img}" docker://"${dst_img}"

done < <(find . -type f -name manifest.json -printf '%P\n')
popd >/dev/null

