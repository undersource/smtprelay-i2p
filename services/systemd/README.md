## Systemd service setup instructions

Setup Example ( Debian )


* Make sure smtprelay is in /usr/local/bin/
```
sudo cp ./smtprelay /usr/local/bin/smtprelay
```
* Create user/group smtprelay and configure smtprelay (adjust Ports and Logging Level if needed) :
```
sudo adduser --system --no-create-home --group smtprelay
```
```
sudo cp ./smtprelay.ini  /etc/smtprelay/smtprelay.ini
```
* Create /var/log/smtprelay/smtprelay.log ( make sure PERMISSIONS are appropriate ) :
```
sudo mkdir /var/log/smtprelay/
sudo touch /var/log/smtprelay/smtprelay.log
sudo chown smtprelay:smtprelay /var/log/smtprelay/smtprelay.log
```
* Setup the service :
```
sudo cp ./smtprelay.service /etc/systemd/system/smtprelay.service
```

