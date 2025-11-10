# Use the official Python 3.10 image
FROM python:3.10-slim

# Set the working directory inside the server
WORKDIR /code

# Copy the requirements file and install the libraries
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy all your project files (main.py, .joblib files) into the server
COPY . /code/

# Tell the server which port to open
EXPOSE 8000

# The command to run your app
# This overrides the "if __name__ == '__main__'" block in your main.py
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]