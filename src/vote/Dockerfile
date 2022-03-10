# Using official python runtime base image
FROM python:3.10.2-buster

# Create an working directory ("/app")
RUN mkdir -p /app

# Switch the context to the newly
WORKDIR /app

# Install our python dependencies.
COPY requirements.txt ./requirements.txt

# Install the Python dependencies by
RUN pip install -r requirements.txt

# Copy our code from the current folder to
# /app inside the container.
COPY . /app

# Default command to be run when launching the container
ENTRYPOINT [ "gunicorn" ]
CMD [ "app:app", "-b", "0.0.0.0:80", "--log-file", "-", "--access-logfile", "-", "--workers", "4", "--keep-alive", "0" ]
