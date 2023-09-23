# Postfix configuration

## main.cf
```
smtpd_banner = Banner text

mail_owner = postfix
setgid_group = postdrop

myhostname = domain.i2p
mydomain = $myhostname

alias_maps = hash:/etc/postfix/aliases
alias_database = $alias_maps

virtual_alias_maps = hash:/etc/postfix/virtual

default_transport = smtp:127.0.0.1:7658

home_mailbox = Maildir/
mailbox_size_limit = 0

manpage_directory = /usr/share/man
sample_directory = /etc/postfix
readme_directory = /usr/share/doc/postfix
queue_directory = /var/spool/postfix
command_directory = /usr/bin
daemon_directory = /usr/lib/postfix/bin
data_directory = /var/lib/postfix
meta_directory = /etc/postfix
shlib_directory = /usr/lib/postfix
html_directory = no
sendmail_path = /usr/bin/sendmail
newaliases_path = /usr/bin/newaliases
mailq_path = /usr/bin/mailq
maillog_file = /var/log/postfix.log
```

## master.cf
```
smtp      inet  n       -       n       -       -       smtpd
    -o smtpd_sasl_auth_enable=yes
    -o smtpd_sasl_type=dovecot
    -o smtpd_sasl_path=private/auth
    -o smtpd_tls_auth_only=no
```