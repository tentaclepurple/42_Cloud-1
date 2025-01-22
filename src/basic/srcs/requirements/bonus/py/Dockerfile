FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y vim python3 git python3-pip


RUN vim +PlugInstall +qall || true

RUN pip install tqdm
RUN pip install requests

#RUN pip3 install virtualenv && \
#    virtualenv venv

RUN git clone https://github.com/tentaclepurple/PY_42_AI.git data


WORKDIR /data/modulo00/ex09/

CMD ["bash"]


