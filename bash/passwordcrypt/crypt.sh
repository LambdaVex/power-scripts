#!/bin/bash

source properties

echo -n "Do you want to Encrypt or Decrypt the data in properties? [e/d]: "
read VAR

if [[ $VAR == 'e' ]]
then
  echo "Encrypting"
  echo "$password" | openssl enc -aes-256-cbc -md sha512 -a -pbkdf2 -iter 100000 -salt -pass pass:"$salt" > secret
elif [[ $VAR == 'd' ]]
then
  echo "Decrypting"
  echo "$secret" | openssl enc -aes-256-cbc -md sha512 -a -d -pbkdf2 -iter 100000 -salt -pass pass:"$salt" > password
else
  echo "....couldn't recognize"
fi
