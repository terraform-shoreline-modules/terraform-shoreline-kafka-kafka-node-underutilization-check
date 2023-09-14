resource "shoreline_notebook" "kafka_node_underutilization_check" {
  name       = "kafka_node_underutilization_check"
  data       = file("${path.module}/data/kafka_node_underutilization_check.json")
  depends_on = []
}

