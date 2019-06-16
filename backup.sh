
# -W = prompt password
# -F = filetype. t: tar, p: plain text

now=$(date +"%Y-%m-%d")
pg_dump -U postgres -W -F p scentenced_dev > scentenced_backup_${now}.sql
