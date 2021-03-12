# gpulogger
Simple bash script (for Linux) and powershell script (for Windows) to post output of nvidia-smi to a server, and a simple python bottle mysql application to recieve and store that data

## Requirements

nvidia-smi  
curl  

## Installation

If necessary:  
`sudo apt-get install nvidia-smi curl`  

`curl https://raw.githubusercontent.com/UoA-eResearch/gpulogger/master/add_to_cron.sh | bash`  
