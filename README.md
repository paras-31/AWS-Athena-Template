# ceq_tf_module_aws_athena_Sample
Configuration in this directory creates Aws Athena

Usage
To run this example you need to execute:
# Terraform Plan/Apply Pipeline

This GitHub Actions workflow automates the Terraform plan and apply process for infrastructure provisioning and management in AWS.

## Workflow Overview

This workflow consists of two main jobs:

1. **terraform-plan**: This job checks out the repository, sets up Terraform, initializes Terraform, runs a Terraform plan, converts the plan to JSON format, uploads the JSON plan to artifacts, and runs Infracost for cost estimation.

2. **terraform-apply**: This job is dependent on the `terraform-plan` job. It checks out the repository, configures AWS credentials, sets up Terraform, initializes Terraform, and applies the Terraform changes.

## Environment Variables

- `REGION`: The AWS region where the infrastructure will be provisioned.

## Secrets

- `AWS_WAR_REMIDIATION_SANDBOX_ACCESS_KEY`: Access key for AWS IAM user with permissions to manage infrastructure.
- `AWS_WAR_REMIDIATION_SANDBOX_SECRET_KEY`: Secret key for AWS IAM user.
- `CEQ_GHREPOSVCUSER_PAT_TOKEN`: Personal access token for accessing the repository.
- `API_TOKEN`: API_TOKEN for Trend Vision Micro to estimate potential security issues or configurations.
-  To get an API Token from Trend Vision One, follow these steps:
    Log in to Trend Vision One: Go to the Trend Vision One console and log in with your credentials.
    Navigate to API Management: Once logged in, go to the "Administration" or "Settings" section. Look for "API Management" or a similar option.
    Create a New API Key: In the API Management section, there should be an option to create a new API key. Click on it.
    Configure API Key Settings: You may need to specify details such as the name of the API key, permissions, and scope. Configure these settings according to
    your needs.
    Generate the API Key: After configuring the settings, click on the "Generate" or "Create" button to generate the API key.
    Save the API Key: Once generated, the API key will be displayed. Make sure to copy and save it securely as you may not be able to view it again later

## Usage

1. Fork this repository.
2. Set up the required secrets in your repository settings.
3. Modify the workflow file as needed for your specific infrastructure and requirements.
4. Commit and push your changes to trigger the workflow.
5. Monitor the workflow execution and review the Terraform plan before applying changes.


Note that this example may create resources which can cost money. Run terraform destroy when you don't need these resources.
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_this"></a> [this](#module\_this) | ceq_tf_template_aws_athena | 0.25.0 |

## Resources

| Name | Type |
|------|------|
| [aws_athena_data_catalog.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/athena_data_catalog) | resource |
| [aws_athena_database.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/athena_database) | resource |
| [aws_athena_named_query.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/athena_named_query) | resource |
| [aws_athena_workgroup.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/athena_workgroup) | resource |
| [aws_kms_key.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional key-value pairs to add to each map in `tags_as_list_of_maps`. Not added to `tags` or `id`.<br>This is for some rare cases where resources want additional configuration of tags<br>and therefore take a list of maps with tag key, value, and additional configuration. | `map(string)` | `{}` | no |
| <a name="input_athena_kms_key"></a> [athena\_kms\_key](#input\_athena\_kms\_key) | Use an existing KMS key for Athena if `create_kms_key` is `false`. | `string` | `null` | no |
| <a name="input_athena_kms_key_deletion_window"></a> [athena\_kms\_key\_deletion\_window](#input\_athena\_kms\_key\_deletion\_window) | KMS key deletion window (in days). | `number` | `7` | no |
| <a name="input_athena_s3_bucket_id"></a> [athena\_s3\_bucket\_id](#input\_athena\_s3\_bucket\_id) | Use an existing S3 bucket for Athena query results if `create_s3_bucket` is `false`. | `string` | `null` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | ID element. Additional attributes (e.g. `workers` or `cluster`) to add to `id`,<br>in the order they appear in the list. New attributes are appended to the<br>end of the list. The elements of the list are joined by the `delimiter`<br>and treated as a single ID element. | `list(string)` | `[]` | no |
| <a name="input_bytes_scanned_cutoff_per_query"></a> [bytes\_scanned\_cutoff\_per\_query](#input\_bytes\_scanned\_cutoff\_per\_query) | Integer for the upper data usage limit (cutoff) for the amount of bytes a single query in a workgroup is allowed to scan. Must be at least 10485760. | `number` | `null` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "descriptor_formats": {},<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "labels_as_tags": [<br>    "unset"<br>  ],<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {},<br>  "tenant": null<br>}</pre> | no |
| <a name="input_create_kms_key"></a> [create\_kms\_key](#input\_create\_kms\_key) | Enable the creation of a KMS key used by Athena workgroup. | `bool` | `true` | no |
| <a name="input_create_s3_bucket"></a> [create\_s3\_bucket](#input\_create\_s3\_bucket) | Enable the creation of an S3 bucket to use Athena query results | `bool` | `true` | no |
| <a name="input_data_catalogs"></a> [data\_catalogs](#input\_data\_catalogs) | Map of Athena data catalogs and related configuration. | `map(any)` | n/a | yes |
| <a name="input_databases"></a> [databases](#input\_databases) | Map of Athena databases and related configuration. | `map(any)` | n/a | yes |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between ID elements.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_descriptor_formats"></a> [descriptor\_formats](#input\_descriptor\_formats) | Describe additional descriptors to be output in the `descriptors` output map.<br>Map of maps. Keys are names of descriptors. Values are maps of the form<br>`{<br>   format = string<br>   labels = list(string)<br>}`<br>(Type is `any` so the map values can later be enhanced to provide additional options.)<br>`format` is a Terraform format string to be passed to the `format()` function.<br>`labels` is a list of labels, in order, to pass to `format()` function.<br>Label values will be normalized before being passed to `format()` so they will be<br>identical to how they appear in `id`.<br>Default is `{}` (`descriptors` output will be empty). | `any` | `{}` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_enforce_workgroup_configuration"></a> [enforce\_workgroup\_configuration](#input\_enforce\_workgroup\_configuration) | Boolean whether the settings for the workgroup override client-side settings. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for keep the existing setting, which defaults to `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | Controls the letter case of the `tags` keys (label names) for tags generated by this module.<br>Does not affect keys of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The order in which the labels (ID elements) appear in the `id`.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 6 labels ("tenant" is the 6th), but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | Controls the letter case of ID elements (labels) as included in `id`,<br>set as tag values, and output by this module individually.<br>Does not affect values of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Set this to `title` and set `delimiter` to `""` to yield Pascal Case IDs.<br>Default value: `lower`. | `string` | `null` | no |
| <a name="input_labels_as_tags"></a> [labels\_as\_tags](#input\_labels\_as\_tags) | Set of labels (ID elements) to include as tags in the `tags` output.<br>Default is to include all labels.<br>Tags with empty values will not be included in the `tags` output.<br>Set to `[]` to suppress all generated tags.<br>**Notes:**<br>  The value of the `name` tag, if included, will be the `id`, not the `name`.<br>  Unlike other `null-label` inputs, the initial setting of `labels_as_tags` cannot be<br>  changed in later chained modules. Attempts to change it will be silently ignored. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.<br>This is the only ID element not also included as a `tag`.<br>The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input. | `string` | `null` | no |
| <a name="input_named_queries"></a> [named\_queries](#input\_named\_queries) | Map of Athena named queries and related configuration. | `map(map(string))` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique | `string` | `null` | no |
| <a name="input_publish_cloudwatch_metrics_enabled"></a> [publish\_cloudwatch\_metrics\_enabled](#input\_publish\_cloudwatch\_metrics\_enabled) | Boolean whether Amazon CloudWatch metrics are enabled for the workgroup. | `bool` | `true` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Terraform regular expression (regex) string.<br>Characters matching the regex will be removed from the ID elements.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_s3_output_path"></a> [s3\_output\_path](#input\_s3\_output\_path) | The S3 bucket path used to store query results. | `string` | `""` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | ID element. Usually used to indicate role, e.g. 'prod', 'staging', 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).<br>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | ID element \_(Rarely used, not included by default)\_. A customer identifier, indicating who this instance of a resource is for | `string` | `null` | no |
| <a name="input_workgroup_description"></a> [workgroup\_description](#input\_workgroup\_description) | A description the of Athena workgroup. | `string` | `""` | no |
| <a name="input_workgroup_encryption_option"></a> [workgroup\_encryption\_option](#input\_workgroup\_encryption\_option) | Indicates whether Amazon S3 server-side encryption with Amazon S3-managed keys (SSE\_S3), server-side encryption with KMS-managed keys (SSE\_KMS), or client-side encryption with KMS-managed keys (CSE\_KMS) is used. | `string` | `"SSE_KMS"` | no |
| <a name="input_workgroup_force_destroy"></a> [workgroup\_force\_destroy](#input\_workgroup\_force\_destroy) | The option to delete the workgroup and its contents even if the workgroup contains any named queries. | `bool` | `false` | no |
| <a name="input_workgroup_state"></a> [workgroup\_state](#input\_workgroup\_state) | State of the workgroup. Valid values are `DISABLED` or `ENABLED`. | `string` | `"ENABLED"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_data_catalogs"></a> [data\_catalogs](#output\_data\_catalogs) | List of newly created Athena data catalogs. |
| <a name="output_databases"></a> [databases](#output\_databases) | List of newly created Athena databases. |
| <a name="output_kms_key_arn"></a> [kms\_key\_arn](#output\_kms\_key\_arn) | ARN of KMS key used by Athena. |
| <a name="output_named_queries"></a> [named\_queries](#output\_named\_queries) | List of newly created Athena named queries. |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | ID of S3 bucket used by Athena. |
| <a name="output_workgroup_id"></a> [workgroup\_id](#output\_workgroup\_id) | ID of newly created Athena workgroup. |
<!-- markdownlint-restore -->
