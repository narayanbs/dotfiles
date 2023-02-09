#!/bin/bash
read -p "Enter the type of project? (plain/react) " project
if [ "$project" = "plain" ]
then
npm install --save-dev eslint-config-prettier eslint-plugin-prettier
cp ../js/plaineslintrc .eslintrc.json
cp ../js/plainprettierrc .prettierrc
elif [ "$project" = "react" ]
then
npm install --save-dev eslint-plugin-react
npm install --save-dev eslint-config-prettier eslint-plugin-prettier
cp ../js/reacteslintrc .eslintrc.json
cp ../js/reactprettierrc .prettierrc
else
  echo "Unknown type"
fi
