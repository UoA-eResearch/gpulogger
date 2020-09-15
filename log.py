from bottle import Bottle, request
import bottle_mysql
import csv
import os
import sys
import config

application = Bottle()
plugin = bottle_mysql.Plugin(dbuser=config.user, dbpass=config.password, dbname='gpu')
application.install(plugin)

def ensure_number(s):
  if s == "[Not Supported]":
    return None
  try:
    float(s)
    return s
  except ValueError:
    return None

@application.post('/')
def post(db):
    print(request.body)
    ip = request.environ.get('REMOTE_ADDR')
    reader = csv.DictReader(request.body, skipinitialspace=True)
    for row in reader:
      print(row)
      result = db.execute("""INSERT INTO gpu_log SET
        `ip` = %s,
        `timestamp` = %s,
        `name` = %s,
        `pci.bus_id` = %s,
        `index` = %s,
        `fan.speed [%%]` = %s,
        `power.draw [W]` = %s,
        `driver_version` = %s,
        `pstate` = %s,
        `pcie.link.gen.max` = %s,
        `pcie.link.gen.current` = %s,
        `pcie.link.width.current` = %s,
        `pcie.link.width.max` = %s,
        `temperature.gpu` = %s,
        `utilization.gpu [%%]` = %s,
        `utilization.memory [%%]` = %s,
        `memory.total [MiB]` = %s,
        `memory.free [MiB]` = %s,
        `memory.used [MiB]` = %s
      """, (
        ip,
        row["timestamp"],
        row["name"],
        row["pci.bus_id"],
        ensure_number(row["index"]),
        ensure_number(row["fan.speed [%]"]),
        ensure_number(row["power.draw [W]"]),
        ensure_number(row["driver_version"]),
        row["pstate"],
        ensure_number(row["pcie.link.gen.max"]),
        ensure_number(row["pcie.link.gen.current"]),
        ensure_number(row["pcie.link.width.current"]),
        ensure_number(row["pcie.link.width.max"]),
        ensure_number(row["temperature.gpu"]),
        ensure_number(row["utilization.gpu [%]"]),
        ensure_number(row["utilization.memory [%]"]),
        ensure_number(row["memory.total [MiB]"]),
        ensure_number(row["memory.free [MiB]"]),
        ensure_number(row["memory.used [MiB]"]),
      ))
    return "OK!"
