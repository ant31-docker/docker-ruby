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
	cp Dockerfile.tpl "$version/Dockerfile"
	sed -i 's/{{RUBY_VERSION}}/'"$version"'/g;' "$version/Dockerfile"
    )
done

travis="$(awk -v 'RS=\n\n' '$1 == "env:" { $0 = "env:'"$travisEnv"'" } { printf "%s%s", $0, RS }' .travis.yml)"
echo "$travis" > .travis.yml
