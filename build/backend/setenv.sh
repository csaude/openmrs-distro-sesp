export JAVA_OPTS="-Dfile.encoding=UTF-8 -server -Djava.awt.headless=true -XX:+UseConcMarkSweepGC -Xms1536m -Xmx6144m -XX:PermSize=768m -XX:MaxPermSize=1024m -Duser.timezone=Africa/Maputo"
#export JAVA_OPTS+=" -agentlib:jdwp=transport=dt_socket,server=y,address=0.0.0.0:8081,suspend=n"
export OPENMRS_RUNTIME_PROPERTIES_FILE='/usr/local/tomcat/openmrs-runtime.properties'