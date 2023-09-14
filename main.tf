terraform {
  required_version = ">= 0.13.1"

  required_providers {
    shoreline = {
      source  = "shorelinesoftware/shoreline"
      version = ">= 1.11.0"
    }
  }
}

provider "shoreline" {
  retries = 2
  debug = true
}

module "kafka_node_underutilization_check" {
  source    = "./modules/kafka_node_underutilization_check"

  providers = {
    shoreline = shoreline
  }
}