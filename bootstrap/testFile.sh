#!/bin/bash

db_name="testDB"
user_name="testUser"

generalBS() {
    echo "Provisioning from $0"
    cp /vagrant/bootstrap/bashrc ~/.bashrc
    source ~/.bashrc
}

postgresBS() {
    sudo apt-get install -y postgresql postgresql-contrib libpq-dev build-essential
    echo `whoami` > /tmp/caller
    sudo su - postgres
    psql --command "CREATE ROLE `cat /tmp/caller` LOGIN createdb;"
    exit
    rm -f /tmp/caller
    service postgresql status
    sudo su - vagrant
}
psqlProvisioning() {
    sudo -u postgres createuser $user_name
    sudo -u postgres createdb $db_name
    echo "Creating DB: $db_name and  User: $user_name"
    sudo -u postgres psql -c "grant all privileges on database $db_name to $user_name;"
}
psqlProvisioning
