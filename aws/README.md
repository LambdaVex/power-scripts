### simple_server.sh
  * just a simple server you can use to run and test something on EC2
  * insance name is not needed 
  * key pair: you can proceed without a key pair
  * network settings: Allow HTTP traffic from the internet or just your IP
  * also be sure in network settings that the vpc is public
  * post the script under user-data in Advanced details
  * finally test and call the Public IPv4 DNS
