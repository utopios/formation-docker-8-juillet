#!/bin/bash
#set -eo pipefail

# host="$(hostname -i || echo 'db')"
# user='postgres'
# db='postgres'
# export PGPASSWORD='postgres'

# args=(
# 	# force postgres to not use the local unix socket (test "external" connectibility)
# 	--host "$host"
# 	--username "$user"
# 	--dbname "$db"
# 	--quiet --no-align --tuples-only
# )

# if select="$(echo 'SELECT 1' | psql "${args[@]}")" && [ "$select" = '1' ]; then
# 	exit 0
# fi

# exit 1

exit 0
