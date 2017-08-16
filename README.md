# Gitlab Packer Demo

Gitlab HA setup template on Azure
===============================

This template is a POC to setup a [Gitlab](https://about.gitlab.com/) system with [High Availability](https://about.gitlab.com/high-availability/)  on [Azure Cloud](https://azure.microsoft.com).

This template is heavily inspired by [Gitlab university : HA on AWS](https://docs.gitlab.com/ce/university/high-availability/aws/).


The project tries to follow Immutable server pattern and Infrastructure-as-Code principles by using :
* [Packer](https://www.packer.io/) to create [Azure Virtual Machine Images (AMI)](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/build-image-with-packer)
* [Puppet](https://www.ansible.com/) to install and configure packages on these Virtual Machine Images when running Packer
* [ARM Templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-manager-template-best-practices) to create and orchestrate the cloud infrastructure
* [cloud-init](https://cloudinit.readthedocs.io/en/latest/) and [jinja2-cli](https://github.com/mattrobenolt/jinja2-cli) to finalize setup automatically when launching Azure instances from AMI
* [Docker](https://www.docker.com/) to run Continuous Integration in containers with [Gitlab-CI](https://about.gitlab.com/gitlab-ci/)


Requirements
------------

* a [Azure account](https://azure.microsoft.com) (**Be careful this template implies creating billable resources on Azure cloud**)

  You will need an [Azure service principal](https://azure.microsoft.coml) and enough admin permissions to create Azure ressources
* a [Azure DNS zone](https://azure.microsoft.com) already created (the template will add new subdomain DNS A records)
* a SSH Key pair to connect to Gitlab and Azure instances (see [Github help for examples](https://azure.microsoft.com/))
* [Packer](https://www.packer.io/) >= 0.12
* [Terraform](https://www.terraform.io/) >= 8.2
* GNU Make or some Unix equivalent Implementation
* *(optional)* [Graphiz](http://www.graphviz.org/) to generate Terraform config Graph Images 
  ```sh
  # on ubuntu/debian
  sudo apt-get install graphviz
  ```


Usage
-----

### Download the terraform and packer templates

```sh
git clone --recursive https://github.com/csanquer/gitlab-setup.git
```

### To create the Gitlab infrastructure

1. Copy and edit the configuration files :

  * **terraform** : `terraform/terraform.dist.tvars` to `terraform/terraform.tvars`
  * **packer** : `packer/config.dist.json` to `packer/config.json`
  
2. create Amazon Machine Images :

  * Gitlab 
  * Gitlab-CI-multirunner 

  ```sh
  make ami
  ```
  
3. check Terraform plan 

  ```sh
  make plan
  ```

3. if terraform plan is correct, create Azure resources by applying the terraform plan

  ```sh
  make apply
  ```

  * you can check again the terraform exported variables output
    ```sh
    make output
    ```
  * you can also get Graphviz graphs of all terraform config
    ```sh
    # in PNG image format
    make graphs
    # or in SVG
    make graphs format=svg
    ```

After creation, wait for a few minutes the autoscaled gitlab instances finish self initialization.

if variables are set in `terraform/terraform.tvars` like :
```hcl
azure_dns_zone = "my-azure.net"
gitlab_dns_subdomain = "gitlab"
```

The Gitlab server should be available to http://gitlab.my-azure.net/ 

### To destroy the Gitlab infrastructure 

```sh
make destroy
```
