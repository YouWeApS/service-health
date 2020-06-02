# service-health

*service-health* is a bash script that do systemd services monitoring and send messages to Slack if service is down.

Installation
------------

```
# Clone git repository
git clone https://github.com/YouWeApS/service-health.git

# Install service-health
sudo bash ./service-health/install.sh SLACK_CHANNEL_NAME SLACK_WEBHOOK_TOKEN
```

Usage
------------
Under user that you want the cron job to be executed run:
```
service-health-scheduler.sh SERVICE_NAME
```
That will add cron job to check health status of the specified service each 5 mins.

Dependecies
------------
*service-health* uses [slacktee](https://github.com/YouWeApS/slacktee) to send messages to Slack. *slacktee*  already included in the main installation process.
