
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# Kafka node underutilization check.
---

This incident type typically refers to situations where a software engineer wants to check if a Kafka node is being used efficiently. Kafka is a distributed messaging system that is widely used for real-time data processing, streaming, and storage. In some cases, a Kafka node may be underutilized, which means it is not processing data as efficiently as it could be. In order to optimize performance, it is important to regularly check if Kafka nodes are being used to their full potential.

### Parameters
```shell
export NETWORK_INTERFACE="PLACEHOLDER"

export KAFKA_PORT="PLACEHOLDER"

export KAFKA_MOUNT_POINT="PLACEHOLDER"

export KAFKA_LOG_FILE="PLACEHOLDER"

export ZOOKEEPER_LOG_FILE="PLACEHOLDER"
```

## Debug

### Check the CPU usage of the Kafka node
```shell
top -b -n 1 | grep kafka
```

### Check the network traffic on the Kafka node
```shell
sudo tcpdump -i ${NETWORK_INTERFACE} port ${KAFKA_PORT}
```

### Check the number of active Kafka connections
```shell
sudo ss -antp | grep ${KAFKA_PORT} | wc -l
```

### Check the disk usage of the Kafka node
```shell
df -h | grep ${KAFKA_MOUNT_POINT}
```

### Check the Kafka logs for any errors or warnings
```shell
tail -f ${KAFKA_LOG_FILE}
```

### Check the ZooKeeper logs for any errors or warnings
```shell
tail -f ${ZOOKEEPER_LOG_FILE}
```