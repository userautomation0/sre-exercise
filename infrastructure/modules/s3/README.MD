## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_metric.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_metric) | resource |
| [aws_s3_bucket_notification.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification) | resource |
| [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.allow_read_from_owner_root](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.allow_secure_only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.combined](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_bucket_policy"></a> [allow\_bucket\_policy](#input\_allow\_bucket\_policy) | Flag to allow additional bucket policies | `bool` | `false` | no |
| <a name="input_allow_root"></a> [allow\_root](#input\_allow\_root) | Flag to allow root access | `bool` | `true` | no |
| <a name="input_allow_secure_only"></a> [allow\_secure\_only](#input\_allow\_secure\_only) | Flag to allow access only over secure transport | `bool` | `true` | no |
| <a name="input_block_public_acls"></a> [block\_public\_acls](#input\_block\_public\_acls) | Block S3 public ACLS, recommended true | `bool` | `true` | no |
| <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy) | Block S3 public policies, recommended true | `bool` | `true` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the bucket to be created | `string` | n/a | yes |
| <a name="input_bucket_policy"></a> [bucket\_policy](#input\_bucket\_policy) | The IAM policy to be used for the buckets policy | `string` | `""` | no |
| <a name="input_bucket_versioning"></a> [bucket\_versioning](#input\_bucket\_versioning) | Enable or Suspend bucket versioning | `string` | `"Enabled"` | no |
| <a name="input_enable_acls"></a> [enable\_acls](#input\_enable\_acls) | Flag to enable the use of ACLs on the bucket | `bool` | `false` | no |
| <a name="input_enable_eventbridge"></a> [enable\_eventbridge](#input\_enable\_eventbridge) | Enable bucket notifications to eventbridge | `bool` | `false` | no |
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | Flag to enable s3 server access logging on the bucket | `bool` | `true` | no |
| <a name="input_enable_policies"></a> [enable\_policies](#input\_enable\_policies) | Flag to enable the use of standard bucket policies for the bucket | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment the bucket will be created for | `string` | n/a | yes |
| <a name="input_ignore_public_acls"></a> [ignore\_public\_acls](#input\_ignore\_public\_acls) | Ignore S3 public ACLS, recommended true | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to deploy into | `string` | `""` | no |
| <a name="input_restrict_public_buckets"></a> [restrict\_public\_buckets](#input\_restrict\_public\_buckets) | Block S3 public buckets, recommended true | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Common tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_vpc_endpoint_s3_id"></a> [vpc\_endpoint\_s3\_id](#input\_vpc\_endpoint\_s3\_id) | The S3 VPCE ID to use when accessing the bucket | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket"></a> [bucket](#output\_bucket) | The bucket that has been created |
| <a name="output_name"></a> [name](#output\_name) | The name of the bucket that has been created |
