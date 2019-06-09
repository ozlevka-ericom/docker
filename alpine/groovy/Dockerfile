# Alpine 3.8 C++/Java Developer Image
#
# For IntelliJ and GUI (X11), run the image with:
# $ XSOCK=/tmp/.X11-unix && sudo docker run -i -v $XSOCK:$XSOCK -e DISPLAY -u developer -t [image-name]
#
# Then run IntelliJ with:
# /idea-IC-191.6707.61/bin/idea.sh

FROM alpine:3.8

ENV LANG C.UTF-8

RUN set -ex && \
	apk --no-cache --update add \
	# basic packages
		bash bash-completion coreutils file grep openssl openssh nano sudo tar xz \
	# debug tools
		gdb musl-dbg strace \
	# docs and man
		bash-doc man man-pages less less-doc \
	# GUI fonts
		font-noto \
	# user utils
		shadow \
	# unzip for zip files
	    unzip

RUN set -ex && \
	apk --no-cache --update add \
	# C++ build tools
		cmake g++ git linux-headers libpthread-stubs make 

RUN set -ex && \
	apk --no-cache --update add \
	# Java tools
		gradle openjdk8 openjdk8-dbg

ENV GROOVY_VERSION 2.5.7
ENV GROOVY_HOME /opt/groovy
# Install IntelliJ Community
#&& mv "groovy-${GROOVY_VERSION}/" "groovy-${GROOVY_VERSION}"
RUN set -ex && \
	wget https://download-cf.jetbrains.com/idea/ideaIC-2019.1.1-no-jbr.tar.gz && \
	tar -xf ideaIC-2019.1.1-no-jbr.tar.gz && \
	rm ideaIC-2019.1.1-no-jbr.tar.gz && \
	wget --output-document=groovy.zip "https://dist.apache.org/repos/dist/release/groovy/${GROOVY_VERSION}/distribution/apache-groovy-binary-${GROOVY_VERSION}.zip" \
	&& echo "Installing Groovy" \
    && unzip groovy.zip \
    && rm groovy.zip \     
    && ln --symbolic "/groovy-${GROOVY_VERSION}/bin/grape" /usr/bin/grape \
    && ln --symbolic "/groovy-${GROOVY_VERSION}/bin/groovy" /usr/bin/groovy \
    && ln --symbolic "/groovy-${GROOVY_VERSION}/bin/groovyc" /usr/bin/groovyc \
    && ln --symbolic "/groovy-${GROOVY_VERSION}/bin/groovyConsole" /usr/bin/groovyConsole \
    && ln --symbolic "/groovy-${GROOVY_VERSION}/bin/groovydoc" /usr/bin/groovydoc \
    && ln --symbolic "/groovy-${GROOVY_VERSION}/bin/groovysh" /usr/bin/groovysh \
    && ln --symbolic "/groovy-${GROOVY_VERSION}/bin/java2groovy" /usr/bin/java2groovy


# Create a new user with no password
ENV USERNAME developer
RUN set -ex && \
	useradd --create-home --key MAIL_DIR=/dev/null --shell /bin/bash $USERNAME && \
	passwd -d $USERNAME

# Set additional environment variables
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV JDK_HOME  /usr/lib/jvm/java-1.8-openjdk
ENV JAVA_EXE  /usr/lib/jvm/java-1.8-openjdk/bin/java
