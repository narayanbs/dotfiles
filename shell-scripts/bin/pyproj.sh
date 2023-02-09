#!/bin/bash

cp ../py/flake8 .flake8
cp ../py/gitignore .gitignore
poetry init -n 
cat ../py/pyproject.toml >> pyproject.toml
