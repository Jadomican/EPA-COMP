# Use an official Python runtime as a parent image
FROM python:2.7-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Define environment variable
ENV NAME World
ENV http_proxy ironweb1.it-tallaght.ie:80
ENV https_proxy ironweb1.it-tallaght.ie:80

# Install any needed packages specified in requirements.txt
RUN pip install --cert /home/epa/ironweb1.it-tallaght.ie.crt --user --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Run app.py when the container launches
#CMD ["python", "app.py"]
CMD ["ls", "/lib64"]
