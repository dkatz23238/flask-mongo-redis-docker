FROM python:3.7-slim

WORKDIR /usr/bin/myapp

COPY requirements.txt /usr/bin/myapp/requirements.txt
# Using pip:
RUN python3.7 -m pip install -r requirements.txt
RUN echo "\nforce_color_prompt=yes\n" >> /root/.bashrc
RUN echo "\nalias python=python3.7\n" >> /root/.bashrc


WORKDIR /usr/bin/myapp
ADD . /usr/bin/myapp
ENV FLASK_APP=./src/app.py
EXPOSE 8080
#
ENTRYPOINT [ "flask", "run", "--host=0.0.0.0", "--port=8080" ]