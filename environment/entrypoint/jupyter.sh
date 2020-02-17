#!/bin/bash -xe

jupyter notebook --ip=0.0.0.0 --port=8085 --allow-root --NotebookApp.token='' --NotebookApp.password=''
