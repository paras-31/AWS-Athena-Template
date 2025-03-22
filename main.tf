module "athena" {
    source = "git::https://github.com/Quick-Iac/ceq_tf_template_aws_athena"
    database_name = var.database_name
    athena_bucket = var.athena_bucket
    athena_workgroup_name = var.athena_workgroup_name
    enforce_workgroup_configuration = var.enforce_workgroup_configuration 
    publish_cloudwatch_metrics_enabled = var.publish_cloudwatch_metrics_enabled
    encryption_option = var.encryption_option
    destination_bucket = var.destination_bucket
    tags= var.tags
    data_catalog_name = var.data_catalog_name
    type = var.type
    catalog_parameters = var.catalog_parameter
    query_name = var.query_name
}
