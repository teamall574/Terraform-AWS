terraform {
  # Required version means your installed Terraform CLI on your system.
  # Terraform checks this before executing commands. If the version
  # doesn’t match, you’ll get an error.

  required_version = "= 1.13.0"  
  # Allows ONLY Terraform v1.13.0 exactly.
  # Example: 1.13.0 → OK, 1.13.1 → FAIL, 1.12.9 → FAIL

  # required_version = "<= 1.6.0"  
  # Example: 1.5.7 → OK, 1.6.0 → OK, 1.7.0 → FAIL

  # required_version = ">= 1.6.0"  
  # Example: 1.6.0 → OK, 1.7.5 → OK, 1.13.0 → OK, 1.5.9 → FAIL

  required_providers {
    aws = {
        source = hashicorp/aws
        # ----------------------------
        # Different ways to lock versions THis is aws version 
        # ----------------------------

        # Exact version (only this version allowed)
        # Example: 5.31 → OK, anything else → FAIL
        # version = "= 5.31"

        # Less than or equal (any version up to 5.31)
        # Example: 5.30 → OK, 5.31 → OK, 5.32 → FAIL
        # version = "<= 5.31"

        # Greater than or equal (5.31 or newer)
        # Example: 5.31 → OK, 5.40 → OK, 6.x → OK
        version = ">= 5.31"

        # Pessimistic constraint (safe upgrades)
        # Allows >= 5.31.0 but < 5.32.0
        # Example: 5.31.1 → OK, 5.31.9 → OK, 5.32 → FAIL
        # version = "~> 5.31"
    }
  }
}

provider "aws"{
    region = "us-east-1"
}