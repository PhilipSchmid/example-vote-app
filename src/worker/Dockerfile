# Using official dotnet base image
FROM --platform=linux/amd64 mcr.microsoft.com/dotnet/core/sdk:2.2

# Set the application directory
RUN mkdir -p /code
WORKDIR /code

# Copy our code from the current src folder to /code/src/Worker inside the container
COPY src/Worker /code/src/Worker

# Install our dotnet dependencies
RUN dotnet restore -v minimal src/Worker \
    && dotnet publish -c Release -o "./" "src/Worker/" 

# Define our default command to be run when launching the container
ENTRYPOINT [ "dotnet" ]
CMD [ "src/Worker/Worker.dll" ]