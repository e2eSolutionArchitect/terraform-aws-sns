output "id" {
  description = "id"
  value       = try(aws_sns_topic.this.id, "")
}

output "arn" {
  description = "arn"
  value       = try(aws_sns_topic.this.arn, "")
}