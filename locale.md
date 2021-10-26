source: https://serverfault.com/questions/604846/locale-gen-with-purge-does-not-work

edit /var/lib/locales/supported.d/* to delete unneeded locales

(re)generate locale

$ sudo locale-gen --purge id_ID.UTF-8 en_US.UTF-8
