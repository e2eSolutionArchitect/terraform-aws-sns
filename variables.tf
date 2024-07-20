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

