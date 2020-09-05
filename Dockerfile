FROM ubuntu
USER root
RUN mkdir simpleApp
COPY simpleApp/* simpleApp/
COPY requirements.txt manage.py ./
RUN ls
RUN apt-get update
RUN apt-get install -y python3.6 python3-pip
RUN apt-get install -y build-essential libssl-dev libffi-dev python-dev
RUN pip3 install -r requirements.txt
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate
CMD ["python3" , "manage.py" , "runserver" , "0.0.0.0:8000"]
#RUN python3 manage.py runserver 0.0.0.0:8000
