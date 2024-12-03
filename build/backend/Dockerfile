FROM openmrs/openmrs-core:dev-amazoncorretto-11 AS dev

WORKDIR /openmrs_distro

ARG OMRS_BUILD_RESULT='/openmrs_distro/sesp'

# Copy maven settings
COPY settings.xml .

# Install OpenMRS SDK
RUN --mount=type=cache,target=/root/.m2 mvn org.openmrs.maven.plugins:openmrs-sdk-maven-plugin:setup-sdk -DbatchAnswers=n

# Copy build files
COPY openmrs-distro.properties ./

# Build the distro
RUN --mount=type=cache,target=/root/.m2 \
    --mount=type=secret,id=GH_USERNAME  \
    --mount=type=secret,id=GH_PASSWORD \
    export GH_USERNAME=$(cat /run/secrets/GH_USERNAME) && \
    export GH_PASSWORD=$(cat /run/secrets/GH_PASSWORD) && \
    mvn -s settings.xml org.openmrs.maven.plugins:openmrs-sdk-maven-plugin:build-distro -Ddir=$OMRS_BUILD_RESULT

RUN cp $OMRS_BUILD_RESULT/web/openmrs_core/openmrs.war /openmrs/distribution/openmrs_core/
RUN cp $OMRS_BUILD_RESULT/web/openmrs-distro.properties /openmrs/distribution/
RUN cp -R $OMRS_BUILD_RESULT/web/openmrs_owas /openmrs/distribution/openmrs_owas

RUN cp -R $OMRS_BUILD_RESULT/web/openmrs_modules /openmrs/distribution/openmrs_modules

FROM hub.csaude.org.mz/sesp/tomcat:9.0.97

COPY --from=dev /openmrs/distribution/openmrs_core/openmrs.war /usr/local/tomcat/webapps/
COPY --from=dev /openmrs/distribution/openmrs_modules /usr/local/tomcat/.OpenMRS/modules
COPY --from=dev /openmrs/distribution/openmrs_owas /usr/local/tomcat/.OpenMRS/owa

COPY configuration /usr/local/tomcat/.OpenMRS/configuration
COPY openmrs-runtime.properties /usr/local/tomcat/openmrs-runtime.properties
COPY setenv.sh /usr/local/tomcat/bin/setenv.sh
