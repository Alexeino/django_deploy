FROM python:3.9
WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update -y

# Install project's dependency
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

RUN apt-get install -y netcat-traditional


COPY ./entrypoint.sh .
RUN sed -i 's/\r$//g' ./entrypoint.sh
RUN chmod +x ./entrypoint.sh


# Copy project files
COPY . .

ENTRYPOINT [ "/app/entrypoint.sh" ]