# Adjust the value of variable nvidia_smi with the location to the nvidia_smi command, which is installed
# when you install the Nvidia driver for the GPU.
# Schedule this script in Task Scheduler to run every minute.
# Hints:
# - On "General" tab, tick "Run whether user is logged on or not" and tick "Do not store password..."
# - On "Triggers" tab: To run every minute, pick Daily, and then "5 minutes" for "Repeat task every" under Advanced settings".
#   Then manually change the 5 to a 1
# - On "Actions" tab: Type "powershell" in the "Program/script" field, and then in the "Add arguments (optional)" field
#   type "-File <path-to-script>" (replace <path-to-script> with the location of this file)

$nvidia_smi = "C:\Windows\System32\DriverStore\FileRepository\nv_dispswi.inf_amd64_f2c8addad5f4bd4b\nvidia-smi.exe"
$nvidia_smi_opts = "--query-gpu=timestamp,name,pci.bus_id,index,fan.speed,power.draw,driver_version,pstate,pcie.link.gen.max,pcie.link.gen.current,pcie.link.width.current,pcie.link.width.max,temperature.gpu,utilization.gpu,utilization.memory,memory.total,memory.free,memory.used", `
                   "--format=csv,nounits,noheader"
$nvidia_smi_output_header = 'timestamp, name, pci.bus_id, index, fan.speed [%], power.draw [W], driver_version, pstate, pcie.link.gen.max, pcie.link.gen.current, pcie.link.width.current, pcie.link.width.max, temperature.gpu, utilization.gpu [%], utilization.memory [%], memory.total [MiB], memory.free [MiB], memory.used [MiB]'
$output = & $nvidia_smi $nvidia_smi_opts

$payload = "$nvidia_smi_output_header`n$output"

$header = @{
 "Content-Type"="text/csv"
} 

Invoke-RestMethod -Uri "http://gpuusage-data.nectar.auckland.ac.nz" -Method 'Post' -Body "$payload" -Headers $headers

