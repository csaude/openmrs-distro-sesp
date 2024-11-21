# SESP
OpenMRS 3.0 distribution.

## Building the images
Dockerfiles for the backend and frontend applications are found in the `build`
folder.
Images can be built with the following commands:

```
docker build -t hub.csaude.org.mz/sesp/openmrs-distro-sesp-frontend:<version>

docker build -t hub.csaude.org.mz/sesp/openmrs-distro-sesp-backend:<version>
```

To successfully build the backend image a few packages from the [GitHub maven registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-apache-maven-registry) need to be downloaded, the registry is configured in `settings.xml`. As of now, to be able to download packages, users need to be [authenticated](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-apache-maven-registry#authenticating-to-github-packages).
Once you have a personal access token (PAT) you have to assign the `GH_USERNAME` and `GH_PASSWORD`(with your PAT) environment variables in order to for them to be picked up in `settings.xml`.