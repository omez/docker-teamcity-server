FROM jetbrains/teamcity-server:latest
MAINTAINER Alexander Sergeychik <alexander.sergeychik@gmail.com>

ENV TC_WAIT_FOR_HOST=localhost
ENV TC_WAIT_FOR_PORT=0

RUN apt-get update && \
	apt-get install -y git netcat \
	&& rm -rf /var/lib/apt/lists/*


# Put wrapper to wait for external database in composition response 
COPY run-services-wrapper.sh /run-services-wrapper.sh
RUN chmod +x /run-services-wrapper.sh

CMD ["/run-services-wrapper.sh"]