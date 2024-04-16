## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_private_repositories"></a> [private\_repositories](#module\_private\_repositories) | ../infrastructure/modules/ecr | n/a |
| <a name="module_state_bucket"></a> [state\_bucket](#module\_state\_bucket) | ../infrastructure/modules/s3/ | n/a |
| <a name="module_state_table"></a> [state\_table](#module\_state\_table) | ../infrastructure/modules/dynamo/ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecr_repositories"></a> [ecr\_repositories](#input\_ecr\_repositories) | n/a | `any` | n/a | yes |
| <a name="input_statement"></a> [statement](#input\_statement) | n/a | `list` | <pre>[<br>  {<br>    "Action": "ecr:*",<br>    "Principal": []<br>  }<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr"></a> [ecr](#output\_ecr) | The urls of the repositories that have been created |
| <a name="output_state_bucket_name"></a> [state\_bucket\_name](#output\_state\_bucket\_name) | The name of the bucket that has been created |
| <a name="output_state_dynamodb_name"></a> [state\_dynamodb\_name](#output\_state\_dynamodb\_name) | The name of the table that has been created |
