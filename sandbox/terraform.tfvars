database_name = "wafr_db"
athena_bucket = "athena-source-bucket-test"
athena_workgroup_name  = "wafr_wb"
enforce_workgroup_configuration = true
publish_cloudwatch_metrics_enabled = true
 encryption_option = "SSE_S3"
 destination_bucket = "athena-destination-test-bucket"
 tags = {
  "START_DATE"       = "30-08-2024"
  "END_DATE"         = "15-09-2024"
  "PROJECT_NAME"     = "AWS WAFR"
  "DEPARTMENT_NAME"  = "AWS DEVOPS"
  "APPLICATION_NAME" = "ATHENA"
  "CLIENT_NAME"      = "CEQ-INTERNAL"
  "OWNER_NAME"       = "nikitagoyal@cloudeq.com"
  # "SOW_NUMBER"       = "CEQSOW24084OV"
  
 }
 data_catalog_name = "wafr_tb"
 type = "GLUE"
 catalog_parameter = { 
    "catalog-id" = "123456789012"
    
  }
 query_name = "test_query"






  


















#<----------------------> without for each
# bucket = "athena-practice-suraj"
# name = "athena-group"
# enforce_workgroup_configuration    = true
# publish_cloudwatch_metrics_enabled = true
# encryption_option = "SSE_S3"