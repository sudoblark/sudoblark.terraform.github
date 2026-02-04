<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/sudoblark/sudoblark.terraform.github">
    <img src="docs/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">sudoblark.terraform.github</h3>

  <p align="center">
    Managed GitHub with GitHub!
  </p>
</div>


# sudoblark.terraform.github
[![CI](https://github.com/sudoblark/sudoblark.terraform.github/actions/workflows/commit-to-pr.yaml/badge.svg)](https://github.com/sudoblark/sudoblark.terraform.github/actions/workflows/commit-to-pr.yaml)
[![CD](https://github.com/sudoblark/sudoblark.terraform.github/actions/workflows/apply.yaml/badge.svg)](https://github.com/sudoblark/sudoblark.terraform.github/actions/workflows/apply.yaml)
[![Terraform Version](https://img.shields.io/badge/Terraform-1.14%2B-blueviolet?logo=terraform)](https://developer.hashicorp.com/terraform/)
[![License](https://img.shields.io/github/license/sudoblark/sudoblark.terraform.github)](https://github.com/sudoblark/sudoblark.terraform.github/blob/main/LICENSE.txt)
[![Maintained](https://img.shields.io/maintenance/yes/2026)](https://github.com/sudoblark/sudoblark.terraform.github)
[![Automation Scope](https://img.shields.io/badge/Scope-GitHub%2FOrg%20Management-blue)](https://github.com/sudoblark/sudoblark.terraform.github)

Terraform setup for Sudoblark GitHub - managing repository creation and configuration through Infrastructure as Code.

Managed GitHub with GitHub!

## Architecture

This repository follows a clean separation of concerns:

### Core Components

- **`modules/repository/`** - Core module implementing GitHub repository creation and configuration
- **`modules/data/`** - Configuration layer where users define repositories and defaults (user-facing)
- **Root** - Implementation layer that orchestrates the data module and core repository module

### How It Works

1. **Configuration** (`modules/data/` module):
   - `modules/data/defaults.tf` - Default values for all repositories (prefix, visibility, codeowners, etc.)
   - `modules/data/repositories_*.tf` - Repository definitions grouped by domain (ci_cd, python, terraform_modules, etc.)
   - `modules/data/repositories.tf` - Combines all repository groups
   - `modules/data/outputs.tf` - Exposes combined repositories and defaults

2. **Implementation** (root):
   - `repositories.tf` - Consumes data module outputs and creates repositories via the core module
   - `main.tf` - Provider configuration

3. **Core Module** (`modules/repository/`):
   - Creates GitHub repositories
   - Manages branch protection
   - Configures CODEOWNERS files
   - Handles licensing

### Adding New Repositories

To add a new repository, simply edit the appropriate file in `modules/data/`:

```hcl
# modules/data/repositories_python.tf
{
  name : "python.my-new-project"
  description : "A new Python project"
  topics : ["python", "cli"]
  open_source : true
  visibility : "public"
}
```

All repositories inherit defaults from `modules/data/defaults.tf` unless explicitly overridden.

It's conceptual counterpart may be considered to be [sudoblark.terraform.modularised-demo](https://github.com/sudoblark/sudoblark.terraform.modularised-demo), which is an example micro-repo using modularised components to fulfill a use-case.

## Developer documentation
The below documentation is intended to assist a developer with interacting with the Terraform code in order to add,
remove or update functionality.

### Pre-requisites
* tfenv
```sh
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bash_profile
```

* Virtual environment with pre-commit installed

```sh
python3 -m venv venv
source venv/bin/activate
pip install pre-commit
```

### Pre-commit hooks
This repository utilises pre-commit in order to ensure a base level of quality on every commit. The hooks
may be installed as follows:

```sh
source venv/bin/activate
pip install pre-commit
pre-commit install
pre-commit run --all-files
```

#### Configured Hooks
- **Terraform formatting** - Ensures consistent Terraform code style
- **YAML linting** - Validates GitHub Actions workflows
- **General file fixes** - Trailing whitespace, end-of-file fixes, merge conflict detection

### Continuous Integration

This repository uses GitHub Actions for quality checks on pull requests:

- **Format Check** - Validates Terraform formatting
- **Validate** - Runs `terraform validate`
- **Checkov** - Security and best practices scanning with policy enforcement
- **Test** - Executes Terraform tests (requires Terraform 1.6.0+)
- **Plan** - Generates and displays terraform plan
- **Infracost** - Cost estimation for infrastructure changes

All checks must pass before merging to main.

### Testing

Terraform tests are implemented using `.tftest.hcl` files to validate:

#### Test Files
- **`tests/data_module.tftest.hcl`** - Validates data module configuration structure and outputs
- **`tests/integration.tftest.hcl`** - Tests resource creation and configuration merging
- **`tests/repository_name_logic.tftest.hcl`** - Validates repository naming and prefix logic

#### Test Categories
- Configuration validation (required fields, data types, naming conventions)
- Resource creation and instantiation
- Name computation and prefix application
- Default value merging
- Uniqueness constraints

Run tests locally with:
```sh
terraform test
```

Tests require Terraform 1.14.0 or higher.
