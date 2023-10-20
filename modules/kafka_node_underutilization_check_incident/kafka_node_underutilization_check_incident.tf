resource "shoreline_notebook" "kafka_node_underutilization_check_incident" {
  name       = "kafka_node_underutilization_check_incident"
  data       = file("${path.module}/data/kafka_node_underutilization_check_incident.json")
  depends_on = [shoreline_action.invoke_rebalance_kafka_partitions]
}

resource "shoreline_file" "rebalance_kafka_partitions" {
  name             = "rebalance_kafka_partitions"
  input_file       = "${path.module}/data/rebalance_kafka_partitions.sh"
  md5              = filemd5("${path.module}/data/rebalance_kafka_partitions.sh")
  description      = "Rebalance the partitions across the Kafka nodes to ensure even distribution of the workload."
  destination_path = "/tmp/rebalance_kafka_partitions.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_rebalance_kafka_partitions" {
  name        = "invoke_rebalance_kafka_partitions"
  description = "Rebalance the partitions across the Kafka nodes to ensure even distribution of the workload."
  command     = "`chmod +x /tmp/rebalance_kafka_partitions.sh && /tmp/rebalance_kafka_partitions.sh`"
  params      = ["TOPIC_NAME","KAFKA_NODE_IP","PORT","NEW_PARTITION_COUNT"]
  file_deps   = ["rebalance_kafka_partitions"]
  enabled     = true
  depends_on  = [shoreline_file.rebalance_kafka_partitions]
}

