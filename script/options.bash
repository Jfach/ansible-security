# vim: set ts=2 sw=2 ai et:

if [[ -n ${CIRCLECI} ]]; then
  CAPS=''
else
  CAPS='--cap-drop all'
fi

IMAGE_NAME_TAG="sometheycallme/ansible-security:latest"
