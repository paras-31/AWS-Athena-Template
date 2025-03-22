variable "database_name" {
    type = string
    description = "Name of the db"
  
}
variable "athena_bucket" {
    type = string
  
}
variable "athena_workgroup_name"{
    type = string
}

variable "enforce_workgroup_configuration" {
    type = bool
    description = ""
  
}

variable "publish_cloudwatch_metrics_enabled" {
    type = bool
    description = ""
  
}

variable "encryption_option" {
    type = string
    description = ""

  
}

variable "destination_bucket"{
    type = string
}
variable "tags"{
    type = any
}
variable "query_name"{
    type = string
}
variable "data_catalog_name"{
    type = string

}
variable "type" {
    type = string
  
}
variable "catalog_parameter"{
    type = any
}
