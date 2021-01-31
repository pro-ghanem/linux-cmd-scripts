#!/usr/bin/env python
# import requirements
import os
import requests
from datetime import datetime
# from boto.s3.key import Key  # incase of using aws s3 sdk
# from boto.s3.connection import S3Connection # incase of using aws s3 sdk

# setup solr replication for backup
# Ref URL : https://cwiki.apache.org/confluence/display/solr/Index+Replication

# prerequisites : - install and configure s3cmd , pip   - install the needed liberaries : requests,...

# setup variables
solr_url = "http://localhost:8983/solr/"  # solr url "http://localhost:8983/solr/"
backup_dir = "/var/solr/data/mytestcollection/data/"  # solr backup directory "/home/solr/backup"
bucket_name = "s3://7awi-backup-bucket"  # s3 bucket name to store backup files

# if u need to use the aws s3 sdk instead of s3cmd
#AWS_ACCESS_KEY = "AKIA2UKUOJBG"  # aws access key
#AWS_SECRET = "cLe6OhZD/OQ5BplUXXQhP"  # aws secret key


def solr_backup(solr_url,backup_dir,bucket_name):
    # set backup name
    backup_name = "solr-backup-" + datetime.now().strftime("%Y-%m-%d")

    # solr url to call backup api
    url = solr_url + "mytestcollection/replication?command=backup&location=" + "data" + "&name=" + backup_name + "&wt=json"
    res = requests.get(url)
    # tar file name to upload
    tar_file_name = backup_dir + backup_name + ".tgz"

    cmd = "tar -czvf " + tar_file_name + " -C " + backup_dir + " " + "snapshot." + backup_name
    os.system(cmd)

    s3cmd_command= "s3cmd sync --skip-existing  " + tar_file_name + " " + bucket_name
    os.system(s3cmd_command)
    print("the end")
if __name__ == '__main__':
    solr_backup(solr_url,backup_dir,bucket_name)
