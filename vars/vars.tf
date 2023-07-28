variable  "sample"  {
  default = 100
}

variable  "sample1" {
  default = "Hello  World"
}

output  "sample"  {
  value = var.sample
}

output  "sample1" {
  value = var.sample1
}

output  "samplr-ext"  {
  value = "Value of sample &  sample1 - ${var.sample} - ${var.sample1}"
}

variable "env" {}

output  "env" {
  value = var.env
}