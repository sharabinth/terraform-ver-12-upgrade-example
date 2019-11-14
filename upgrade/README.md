# Perform Upgrade
Perform the upgrade to Terraform ver 0.12 from this folder so that the original terraform config will not be overwritten.

## Steps
1. Copy the main.tf file to this folder.

2. Make sure that Terraform version 0.12.x is in use
```
terraform version

Terraform v0.12.14
```

3. Initialise to download any required providers as Terraforrm Upgrade will not work if provider plugins are not available.
```
terraform init

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "aws" (hashicorp/aws) 2.35.0...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.aws: version = "~> 2.35"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

4. Run the upgrade command
```
terraform 0.12upgrade

This command will rewrite the configuration files in the given directory so
that they use the new syntax features from Terraform v0.12, and will identify
any constructs that may need to be adjusted for correct operation with
Terraform v0.12.

We recommend using this command in a clean version control work tree, so that
you can easily see the proposed changes as a diff against the latest commit.
If you have uncommited changes already present, we recommend aborting this
command and dealing with them before running this command again.

Would you like to upgrade the module in the current directory?
  Only 'yes' will be accepted to confirm.

  Enter a value: yes

-----------------------------------------------------------------------------

Upgrade complete!

The configuration files were upgraded successfully. Use your version control
system to review the proposed changes, make any necessary adjustments, and
then commit.
```

## Observations After Upgrade
If the upgrade is successful then a terraform config file versions.tf will be created to force the required terraform version.

```
cat versions.tf

terraform {
  required_version = ">= 0.12"
}
```

The variable reference is upgraded to use the Terraform 0.12 syntax
```
cat main.tf

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = "t2.micro"

  tags = {
    Name = "TF 0.12 Upgrade"
  }
}

variable "ami" {
  type = string
}
```

This repo contains the output after the execution of the upgrade command
