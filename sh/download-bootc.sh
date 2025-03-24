#!/bin/bash

# this is the same as download-apps.sh but with a different images list file and images dir

PULL_SECRET_FILE=~/Downloads/pull-secret
IMAGE_LIST_FILE=~/bootc-images-list.txt
IMAGE_LOCAL_DIR=~/bootc-containers

while read -r src_img ; do
   # Remove the source registry prefix
   dst_img=$(echo "${src_img}" | cut -d '/' -f 2-)

   # Run the image download command
   echo "Downloading '${src_img}' to '${IMAGE_LOCAL_DIR}'"
   mkdir -p "${IMAGE_LOCAL_DIR}/${dst_img}"
   skopeo copy --all --quiet \
      --preserve-digests \
      --authfile "${PULL_SECRET_FILE}" \
      docker://"${src_img}" dir://"${IMAGE_LOCAL_DIR}/${dst_img}"

done < "${IMAGE_LIST_FILE}"

