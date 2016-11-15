#!/bin/bash

set -ex

# Add curator as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- curator "$@"
fi

# Step down via gosu  
if [ "$1" = 'curator' ]; then
	exec gosu curator bash -c "while true; do curator --host $ELASTICSEARCH_HOST snapshot --repository  $ELASTICSEARCH_REPO indices --all-indices; set -e; sleep $(( 60*60*INTERVAL_IN_HOURS )); set +e; done"
fi

# As argument is not related to curator,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
