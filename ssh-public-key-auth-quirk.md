when ssh public-key authentication failed, try:
* verify file & directory ownership and mode on client & server
* generate new key with ssh-keygen and add to ~/.ssh/config:

host *
  IdentityFile ~/.ssh/new_key
  IdentityFile ~/.ssh/old_key
