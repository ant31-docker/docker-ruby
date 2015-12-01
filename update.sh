#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
    versions=( */ )
fi
versions=( "${versions[@]%/}" )

travisEnv=
for version in "${versions[@]}"; do
    travisEnv='\n  - VERSION='"$version$travisEnv"
    mkdir "$version" || true
    (
	set -x
	cp Dockerfile.tpl "build/Dockerfile"
	sed -i 's/{{RUBY_VERSION}}/'"$version"'/g;' "build/Dockerfile"
    )
    git tag $version -f
done
