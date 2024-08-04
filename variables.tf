# -------------------------------------------
# Common Variables
# -------------------------------------------
variable "sns_name" {
  description = "SNS Topic Name"
  type        = string
  default     = null
}


variable "tags" {
  description = "Tag map for the resource"
  type        = map(string)
  default     = {}
}

variable "fifo_topic" {
  description = "fifo_topic"
  type        = bool
  default     = false
}

variable "kms_master_key_id" {
  description = "kms_master_key_id"
  type        = string
  default     = true
}

# --------------------------
# KMS
# --------------------------

variable "is_enabled" {
  description = "kms key is_enabled"
  type        = bool
  default     = true
}

variable "enable_key_rotation" {
  description = "kms key enable_key_rotation"
  type        = bool
  default     = true
}

variable "deletion_window_in_days" {
  description = "deletion_window_in_days"
  type        = number
  default     = 10
}

variable "kms_alias" {
  description = "kms_alias"
  type        = string
  default     = null
}
