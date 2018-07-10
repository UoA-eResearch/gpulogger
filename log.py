from bottle import Bottle, request
import bottle_mysql
import csv
import os
import sys
import config

application = Bottle()
plugin = bottle_mysql.Plugin(dbuser=config.user, dbpass=config.password, dbname='gpu')
application.install(plugin)

@application.post('/')
def post(db):
    print(request.body)
    ip = request.environ.get('HTTP_X_FORWARDED_FOR') or request.environ.get('REMOTE_ADDR')
    reader = csv.DictReader(request.body, skipinitialspace=True)
    for row in reader:
      print(row)
      result = db.execute("""INSERT INTO gpu SET
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
        row["index"],
        row["fan.speed [%]"],
        row["power.draw [W]"],
        row["driver_version"],
        row["pstate"],
        row["pcie.link.gen.max"],
        row["pcie.link.gen.current"],
        row["pcie.link.width.current"],
        row["pcie.link.width.max"],
        row["temperature.gpu"],
        row["utilization.gpu [%]"],
        row["utilization.memory [%]"],
        row["memory.total [MiB]"],
        row["memory.free [MiB]"],
        row["memory.used [MiB]"],
      ))
    return "OK!"
