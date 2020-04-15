#!/bin/bash
sudo nvidia-smi --persistence-mode=ENABLED
curl -X POST -H "Content-Type: text/csv" -d "`nvidia-smi --query-gpu=timestamp,name,pci.bus_id,index,fan.speed,power.draw,driver_version,pstate,pcie.link.gen.max,pcie.link.gen.current,pcie.link.width.current,pcie.link.width.max,temperature.gpu,utilization.gpu,utilization.memory,memory.total,memory.free,memory.used --format=csv,nounits`" gpuusage.nectar.auckland.ac.nz
