#!/bin/bash

croncmd="curl https://raw.githubusercontent.com/UoA-eResearch/gpulogger/master/query_gpu_and_post.sh | bash"
cronjob="* * * * * $croncmd"
( crontab -l | grep -v -F "$croncmd" ; echo "$cronjob" ) | crontab -
echo "GPU logging script added to crontab :)"
