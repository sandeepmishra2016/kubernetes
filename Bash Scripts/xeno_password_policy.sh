#!/usr/bin/env bash
count=grep -i 'password for user xeno will expire in 6 days' /var/log/secure.2 | wc -l
if [[ count -gt 0 ]] then
#chage -I -1 -m 0 -M 99999 -E -1 xeno
echo "this is test email " | mailx -s 'xeno_password_policy cron job' sandeepmishra@fico.com siddiquekhan@fico.com
fi
