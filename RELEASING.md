# Releases

Releasing these images is super easy. You need to have already logged in to Docker.

```sh
$ docker login
```

Then just run `make all`. This will make sure we're using the latest node
releases, and take care of tagging, updating changelog, etc.

Versioning is handled by `standard-version`. Every time we run `make publish`
or `make all` (which runs `publish`) a new version is created in the github
repository. The version is tagged with this project's version number, e.g.
`v0.3.0` and also with tags for each of the node versions published, e.g.
`node-4.8.2`.
