# Use a specific python image as base image.
FROM python:3.11.2-bullseye
# Add meaningful labels: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#label
LABEL org.opencontainers.image.authors="Max Mustermann" \
      org.opencontainers.image.version="0.1.0" \
      org.opencontainers.image.title="vote-demo-vote" \
      org.opencontainers.image.description="Python based 'vote' microservice for the Voting Demo App."
# Use service user: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#user
ENV WORKDIR=/app \
    USERNAME=svcuser
RUN useradd -rm -d $WORKDIR -s /bin/bash --user-group -u 1001 $USERNAME
WORKDIR $WORKDIR
# Install Python dependencies as root, so the gunicorn binary gets installed to /usr/local/bin instead of ~/.local/bin, which isn't in PATH. Also make sure pip doesn't create any cache directory. Context: https://stackoverflow.com/a/73174553
COPY --chown=$USERNAME:$USERNAME requirements.txt ./requirements.txt
RUN pip install --no-cache-dir --disable-pip-version-check -r requirements.txt
# Switch to the service user and copy the application files into the user's HOME.
USER $USERNAME
COPY --chown=$USERNAME:$USERNAME . $WORKDIR/
# Document the port this images exposes. Must be >1024 (non privileged ports)
EXPOSE 8080
# This image should only be used for gunicorn applications, therefore define this as ENTRYPOINT. Pass the application specific gunicorn arguments via CMD.
ENTRYPOINT [ "gunicorn" ]
CMD [ "app:app", "-b", "0.0.0.0:8080", "--log-file", "-", "--access-logfile", "-", "--workers", "4", "--keep-alive", "0" ]