Dockmaster is a naive ~100 lines program to send logs from docker to kafka.
All data is produced in JSON.
It creates a key for every message, stored in '_id', in order to allow idempotent operations.

All code in this repo is licenced under the ISC.
All dependencies and libraries used may have other licenses.
