variable "Name"{
    description="name of the tag"
    type= string
}

variable "bucket"{
    description="name of the bucket"
    type=string
}

variable "versioning_status"{
    description="describes status of versioning"
    type=string
    default = "Enabled"
    validation {
        condition = can(regex("^Enabled$|^Disabled$", var.versioning_status))
        error_message = "Invalid versioning status. Valid values are 'Enabled' or 'Disabled'."
    }
}