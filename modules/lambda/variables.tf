variable "filename" {
  type    = string
  default = null
}

variable "function_name" {
  type = string
}

variable "description" {
  type    = string
  default = null
}

variable "handler" {
  type = string
}

variable "runtime" {
  type = string
}

variable "layers" {
  type    = list(string)
  default = []
}

variable "environment_variables" {
  type    = map(string)
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "timeout" {
  type    = number
  default = 3
}

variable "memory_size" {
  type    = number
  default = 128
}

variable "architectures" {
  type    = list(string)
}