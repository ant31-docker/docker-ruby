#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
    versions=( */ )
fi
versions=( "${versions[@]%/}" )

for version in "${versions[@]}"; do
    (
	set -x
	cp Dockerfile.tpl "build/Dockerfile"
	sed -i 's/{{RUBY_VERSION}}/'"$version"'/g;' "build/Dockerfile"
    )
    git commit -a -m "Ruby $version"
    git tag $version -f
done
