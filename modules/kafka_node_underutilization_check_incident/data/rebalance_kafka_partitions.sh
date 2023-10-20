

#!/bin/bash



# Rebalance the partitions across the Kafka nodes

kafka-topics.sh --bootstrap-server ${KAFKA_NODE_IP}:${PORT} --alter --topic ${TOPIC_NAME} --partitions ${NEW_PARTITION_COUNT}



echo "Partition rebalancing complete."