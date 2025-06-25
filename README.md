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
[![Terraform Version](https://img.shields.io/badge/Terraform-1.7%2B-blueviolet?logo=terraform)](https://developer.hashicorp.com/terraform/)
[![License](https://img.shields.io/github/license/sudoblark/sudoblark.terraform.github)](https://github.com/sudoblark/sudoblark.terraform.github/blob/main/LICENSE.txt)
[![Maintained](https://img.shields.io/maintenance/yes/2025)](https://github.com/sudoblark/sudoblark.terraform.github)
[![Automation Scope](https://img.shields.io/badge/Scope-GitHub%2FOrg%20Management-blue)](https://github.com/sudoblark/sudoblark.terraform.github)

Terraform setup for Sudoblark GitHub - repo managed by sudoblark.terraform.github.

Managed GitHub with GitHub!

`modules` defines a `repository` module to create a new GitHub repo.

We instantiate this many times... `x.tf` files in the root of this repo split repositories by domains of interest,
projects or other such logical separations. These are then combined in `locals.tf` into a single data
structure which is then used to instantiate our module many times in `repositories.tf`.

In this manner, we may define repositories as dictionaries, combining them into a dictionary of dictionaries,
in order to create as many repos as we like via complex data structures. Whilst still separating concerns
via the individual project.tf files or higher-level dictionary keys.

It's counter may be considered to be [sudoblark.terraform.modularised-demo](https://github.com/sudoblark/sudoblark.terraform.modularised-demo) , which is an example micro-repo using modularised components to fulfill a use-case

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
