# Common configurations

variable "common_tags" {
  type        = map(string)
  description = "(Optional) Map of common tags for all taggable AWS resources."
  default     = {}
}

# Backup configurations

variable "backup_schedule" {
  description = "Cron expression for the backup job."
  type        = string
  default     = "0 0 * * *"
}

variable "backup_retention_count" {
  description = "Number of backups to keep."
  type        = number
  default     = 7
}

# Load balancer & TLS

variable "lb_internal" {
  description = "Whether the load balancer will be internal or public"
  type        = bool
  default     = false
}

variable "lb_deregistration_delay" {
  type        = string
  description = "Amount time, in seconds, for GraphDB LB target group to wait before changing the state of a deregistering target from draining to unused."
  default     = 300
}

variable "lb_health_check_path" {
  type        = string
  description = "The endpoint to check for GraphDB's health status."
  default     = "/rest/cluster/node/status"
}

variable "lb_health_check_interval" {
  description = "(Optional) Interval in seconds for checking the target group healthcheck. Defaults to 10."
  type        = number
  default     = 10
}

variable "lb_tls_certificate_arn" {
  description = "ARN of the TLS certificate, imported in ACM, which will be used for the TLS listener on the load balancer."
  type        = string
  default     = null
}

variable "lb_tls_policy" {
  description = "TLS security policy on the listener."
  type        = string
  default     = "ELBSecurityPolicy-TLS13-1-2-2021-06"
}

#

variable "allowed_inbound_cidrs_lb" {
  type        = list(string)
  description = "(Optional) List of CIDR blocks to permit inbound traffic from to load balancer"
  default     = null
}

variable "allowed_inbound_cidrs_ssh" {
  type        = list(string)
  description = "(Optional) List of CIDR blocks to permit for SSH to GraphDB nodes"
  default     = null
}

variable "instance_type" {
  type        = string
  default     = "r6g.2xlarge"
  description = "EC2 instance type"
  nullable    = false
}

variable "key_name" {
  type        = string
  default     = null
  description = "(Optional) key pair to use for SSH access to instance"
}

variable "node_count" {
  type        = number
  default     = 3
  description = "Number of GraphDB nodes to deploy in ASG"
}

variable "permissions_boundary" {
  description = "(Optional) IAM Managed Policy to serve as permissions boundary for created IAM Roles"
  type        = string
  default     = null
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Subnet IDs to deploy GraphDB into"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Public subnets used if LB is public"
}

variable "resource_name_prefix" {
  type        = string
  description = "Resource name prefix used for tagging and naming AWS resources"
}

variable "ami_id" {
  type        = string
  description = "(Optional) User-provided AMI ID to use with GraphDB instances. If you provide this value, please ensure it will work with the default userdata script (assumes latest version of Ubuntu LTS). Otherwise, please provide your own userdata script using the user_supplied_userdata_path variable."
  default     = null
}

variable "graphdb_version" {
  description = "GraphDB version"
  type        = string
  default     = "10.4.0-RC8"
  nullable    = false
}

variable "user_supplied_iam_role_name" {
  type        = string
  description = "(Optional) User-provided IAM role name. This will be used for the instance profile provided to the AWS launch configuration. The minimum permissions must match the defaults generated by the IAM submodule."
  default     = null
}

variable "user_supplied_userdata_path" {
  type        = string
  description = "(Optional) File path to custom userdata script being supplied by the user"
  default     = null
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where GraphDB will be deployed"
}

variable "device_name" {
  description = "The device to which EBS volumes for the GraphDB data directory will be mapped."
  type        = string
  default     = "/dev/sdf"
}

variable "ebs_volume_type" {
  description = "Type of the EBS volumes, used by the GraphDB nodes."
  type        = string
  default     = "gp3"
}

variable "ebs_volume_size" {
  description = "The size of the EBS volumes, used by the GraphDB nodes."
  type        = number
  default     = 500
}

variable "ebs_volume_throughput" {
  description = "Throughput for the EBS volumes, used by the GraphDB nodes."
  type        = number
  default     = 250
}

variable "ebs_volume_iops" {
  description = "IOPS for the EBS volumes, used by the GraphDB nodes."
  type        = number
  default     = 8000
}

variable "ebs_kms_key_arn" {
  description = "KMS key used for ebs volume encryption."
  type        = string
  default     = "alias/aws/ebs"
}

variable "prevent_resource_deletion" {
  description = "Defines if applicable resources should be protected from deletion or not"
  type        = bool
  default     = true
}

variable "graphdb_license_path" {
  description = "Local path to a file, containing a GraphDB Enterprise license."
  type        = string
  default     = null
}

variable "zone_dns_name" {
  description = "DNS name for the private hosted zone in Route 53"
  type        = string
  default     = "graphdb.cluster"
}
