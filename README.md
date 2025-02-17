# SESP
OpenMRS 3.0 distribution.

## Building the images
Dockerfiles for the backend and frontend applications are found in the `build`
folder.
The frontend image can be built with the following command:
```
docker build -t hub.csaude.org.mz/sesp/openmrs-distro-sesp-frontend:<version> .
```

To successfully build the backend image a few packages from the [GitHub maven registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-apache-maven-registry) need to be downloaded, the registry is configured in the  `settings.xml`. As of now, to be able to download packages, users need to be [authenticated](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-apache-maven-registry#authenticating-to-github-packages).
Once you have a personal access token (PAT) you have to assign the `GH_USERNAME` and `GH_PASSWORD` (with your PAT) environment variables in order to for them to be picked up in `settings.xml`.

The backend image can be built with the following command:

```
docker build --secret id=GH_USERNAME --secret id=GH_PASSWORD -t hub.csaude.org.mz/sesp/openmrs-distro-sesp-backend:<version> .
```

## Steps to run
1. Place the SQL dump of the database which has to be named _openmrs.sql_ in _**/database/scripts**_ directory.
2. While in the project's directory run the command `docker compose up -d`.

**Note:** Don't forget to provide the required SQL dump file.
