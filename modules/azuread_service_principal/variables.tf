variable "service_principal_name" {
  description = "Name of the service principal to be created"
}

variable "enabled" {
    description = "Determine whether this module should be run or not."
    default = 0
}