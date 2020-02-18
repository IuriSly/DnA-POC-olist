FROM jupyter/pyspark-notebook

USER root
RUN apt-get -qq update && apt-get install -y --no-install-recommends apt-utils openssh-client

USER $NB_UID

WORKDIR /opt/dna-caio/

ARG SSH_PRIVATE_KEY
RUN mkdir -p ~/.ssh/
RUN echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
RUN chmod 600 ~/.ssh/id_rsa
RUN touch ~/.ssh/known_hosts
RUN ssh-keyscan github.com >> ~/.ssh/known_hosts

# ADD requirements.txt .
# RUN pip install -r requirements.txt

RUN rm ~/.ssh/id_rsa

CMD jupyter notebook \
        --ip=0.0.0.0 \
        --port=8085 \
        --allow-root \
        --NotebookApp.notebook_dir='./notebooks' \
        --NotebookApp.token='' \
        --NotebookApp.password=''
