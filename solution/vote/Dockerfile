# TODO: Use the official python image as base image. Use version "3.10.2-buster".
FROM python:3.10.2-buster

# TODO: Create a directory called "/app"
RUN mkdir -p /app

# TODO: Switch the context to the newly created working directory
WORKDIR /app

# TODO Add the dependency file "requirements.txt" to the image
COPY requirements.txt ./requirements.txt

# TODO Install the Python dependencies via "pip install -r requirements.txt"
RUN pip install -r requirements.txt

# TODO Ensure the code from the current folder is added to the /app directory inside the container
COPY . /app

# TODO: Document which port is exposed by default: 80/tcp
EXPOSE 80

# TODO: Default command to be run when launching the container: gunicorn
ENTRYPOINT [ "gunicorn" ]

# TODO: Default args for this image: "app:app -b 0.0.0.0:80 --log-file - --access-logfile - --workers 4 --keep-alive0"
CMD [ "app:app", "-b", "0.0.0.0:80", "--log-file", "-", "--access-logfile", "-", "--workers", "4", "--keep-alive", "0" ]
