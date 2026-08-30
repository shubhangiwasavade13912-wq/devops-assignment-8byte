variable "db_username" {
  description = "Username for the Postgresql db"
  type        = string
}
variable "db_password" {
  description = "Paswrd for the Postgresql db"
  type        = string
  sensitive   = true
}