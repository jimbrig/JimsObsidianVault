---
Date: 2023-06-07
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags:
  - "#Type/Note"
  - "#Topic/Unknown"
Alias: []
---

# Terraform Testing Strategies

> [!SOURCE] Sources
> - *[Link to Source]()*

## Contents

[TOC]

## Overview

> [!NOTE] About
> *Description of note contents.*

As with any code, you should implement some testing strategies to help validate your code and ensure that your changes do not cause any unexpected issues or break existing functionality.

Common Terraform testing strategies include:

- Integration testing
- Unit testing
- End-to-end (E2E) testing
- Linting
- Compliance Testing
- Drift Testing

In this article, we will take a look at each and how to use them with Terraform code.

## Integration Testing

Integration testing involves testing your entire infrastructure configuration, including any dependencies on other resources, to ensure that they work together correctly. Terraform has built-in dependency mapping and management that can be utilized to make sure the changes being made are as expected.

You can use tools like **Terratest** or **Kitchen-Terraform** for integration testing.

The following tools can also be used in the workflow, and including them in the CI pipeline will form Integration Testing:

- [**Terraform fmt**](https://spacelift.io/blog/terraform-fmt) — to format the code correctly.
- [**Terraform validate**](https://spacelift.io/blog/terraform-validate) — to verify the syntax.
- [**Terraform plan**](https://spacelift.io/blog/terraform-plan) — to verify the config file will work as expected.
- [**TFLint**](https://github.com/terraform-linters/tflint) — to verify the contents of the configuration as well as the syntax and structure, also checks account limits (e.g. that a VM instance type is valid, and that the limit on the number of VMs in Azure has not been reached).
- [**Kitchen-Terraform**](https://newcontext-oss.github.io/kitchen-terraform/) **—** Kitchen-Terraform is an open-source tool that provides a framework for writing automated tests that validate the configuration and behavior of Terraform code, including testing for errors, resource creation, destruction, and validation of outputs. Kitchen-Terraform uses a combination of Ruby, Terraform, and Test Kitchen to spin up infrastructure in a sandbox environment, run tests, and destroy the infrastructure once testing is complete.
- [**Terratest**](https://terratest.gruntwork.io/) **—** Terratest is an open-source testing framework for testing Terraform that can also be used to test Kubernetes, Docker, and Packer, amongst others. Terratest enables automated testing of infrastructure code in a sandbox environment to validate that it meets requirements, functions as expected, and is reliable. Tests are written in Go, and it provides a rich set of testing functions that allow the user to automate the entire testing process, including provisioning resources, running tests, and cleaning up resources. Terratest also provides built-in support for popular testing frameworks like Ginkgo and Gomega.

In this article, we will take a look at Terraform testing strategies using different types of commonly used testing, tools and platforms. Let’s jump straight in!

We will cover:

1. [Terraform Testing Strategies](https://spacelift.io/blog/terraform-test#terraform-testing-strategies)
2. [Integration testing](https://spacelift.io/blog/terraform-test#integration-testing)
3. [Unit testing](https://spacelift.io/blog/terraform-test#unit-testing)
4. [End-to-end (E2E) testing](https://spacelift.io/blog/terraform-test#endtoend-e2e-testing)
5. [Linting](https://spacelift.io/blog/terraform-test#linting)
6. [Compliance Testing](https://spacelift.io/blog/terraform-test#compliance-testing)
7. [Drift Testing](https://spacelift.io/blog/terraform-test#drift-testing)

## Terraform Testing Strategies[](https://spacelift.io/blog/terraform-test#terraform-testing-strategies)

As with any code, you should implement some testing strategies to help validate your code and ensure that your changes do not cause any unexpected issues or break existing functionality.

Common Terraform testing strategies include:

- Integration testing
- Unit testing
- End-to-end (E2E) testing
- Linting
- Compliance Testing
- Drift Testing

In this article, we will take a look at each and how to use them with Terraform code.

## Integration Testing[](https://spacelift.io/blog/terraform-test#integration-testing)

Integration testing involves testing your entire infrastructure configuration, including any dependencies on other resources, to ensure that they work together correctly. Terraform has built-in dependency mapping and management that can be utilized to make sure the changes being made are as expected.

You can use tools like **Terratest** or **Kitchen-Terraform** for integration testing.

The following tools can also be used in the workflow, and including them in the CI pipeline will form Integration Testing:

- [**Terraform fmt**](https://spacelift.io/blog/terraform-fmt) — to format the code correctly.
- **[Terraform validate](https://spacelift.io/blog/terraform-validate)** — to verify the syntax.
- [**Terraform plan**](https://spacelift.io/blog/terraform-plan) — to verify the config file will work as expected.
- [**TFLint**](https://github.com/terraform-linters/tflint) — to verify the contents of the configuration as well as the syntax and structure, also checks account limits (e.g. that a VM instance type is valid, and that the limit on the number of VMs in Azure has not been reached).
- [**Kitchen-Terraform**](https://newcontext-oss.github.io/kitchen-terraform/) **—** Kitchen-Terraform is an open-source tool that provides a framework for writing automated tests that validate the configuration and behavior of Terraform code, including testing for errors, resource creation, destruction, and validation of outputs. Kitchen-Terraform uses a combination of Ruby, Terraform, and Test Kitchen to spin up infrastructure in a sandbox environment, run tests, and destroy the infrastructure once testing is complete.
- [**Terratest**](https://terratest.gruntwork.io/) **—** Terratest is an open-source testing framework for testing Terraform that can also be used to test Kubernetes, Docker, and Packer, amongst others. Terratest enables automated testing of infrastructure code in a sandbox environment to validate that it meets requirements, functions as expected, and is reliable. Tests are written in Go, and it provides a rich set of testing functions that allow the user to automate the entire testing process, including provisioning resources, running tests, and cleaning up resources. Terratest also provides built-in support for popular testing frameworks like Ginkgo and Gomega.

### How to Use Terratest

In the Terratest example below, a function is created to test the creation of an Azure storage account in a resource group, and a container in the storage account, then verifies that the storage account and container exist. The resources are then cleaned up after the test is complete.

```hcl
package test

import (
 "context"
 "fmt"
 "testing"
 "time"

 "github.com/Azure/azure-sdk-for-go/storage"
 "github.com/gruntwork-io/terratest/modules/azure"
 "github.com/gruntwork-io/terratest/modules/random"
 "github.com/gruntwork-io/terratest/modules/testing"
)

func TestAzureStorageAccount(t *testing.T) {
 t.Parallel()

 // Set the Azure subscription ID and resource group where the Storage Account will be created
 uniqueID := random.UniqueId()
 subscriptionID := "YOUR_AZURE_SUBSCRIPTION_ID"
 resourceGroupName := fmt.Sprintf("test-rg-%s", uniqueID)

 // Create the resource group
 azure.CreateResourceGroup(t, resourceGroupName, "uksouth")

 // Set the Storage Account name and create the account
 accountName := fmt.Sprintf("teststorage%s", uniqueID)
 accountType := storage.StandardZRS
 location := "uksouth"
 account := azure.CreateStorageAccount(t, subscriptionID, resourceGroupName, accountName, accountType, location)

 // Create a container in the Storage Account
 ctx := context.Background()
 client, err := storage.NewBasicClient(accountName, azure.GenerateAccountKey(t, accountName))
 if err != nil {
  t.Fatalf("Failed to create Storage Account client: %v", err)
 }
 service := client.GetBlobService()
 containerName := fmt.Sprintf("testcontainer%s", uniqueID)
 if _, err := service.CreateContainer(ctx, containerName, nil); err != nil {
  t.Fatalf("Failed to create container: %v", err)
 }

 // Check if the container exists
 testing.WaitForTerraform(ctx, terraformOptions, nil)

 // Cleanup resources
 defer azure.DeleteResourceGroup(t, resourceGroupName)
}
```

## Unit Testing

## End-to-End (E2E) Testing[](https://spacelift.io/blog/terraform-test#endtoend-e2e-testing)

End-to-end testing involves testing your infrastructure configuration in a production-like environment to ensure that it works as expected in a real-world scenario. This can be done using tools like **Terratest** or manual testing in a staging environment.

Continuing with the Azure storage account example, let’s look at how we can use Terratest to implement end-to-end testing.

1. Create a Terraform [configuration file](https://spacelift.io/blog/terraform-files) that defines an Azure Storage account and container:

_main.tf_

```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "test" {
  name     = "test-resource-group"
  location = "uksouth"
}

resource "azurerm_storage_account" "test" {
  name                     = "teststorageaccount"
  resource_group_name      = azurerm_resource_group.test.name
  location                 = azurerm_resource_group.test.location
  account_tier             = "Standard"
  account_replication_type = "ZRS"

  tags = {
    environment = "test"
  }
}

resource "azurerm_storage_container" "test" {
  name                  = "testcontainer"
  storage_account_name  = azurerm_storage_account.test.name
  container_access_type = "private"
}
```

2. Create a Terratest test file to deploy the Terraform configuration and validate the created Azure Storage account exists, along with testing that the container has the correct name and access type.

_storage_test.go_

```hcl
package test

import (
 "context"
 "fmt"
 "os"
 "testing"

 "github.com/Azure/azure-sdk-for-go/profiles/latest/storage/mgmt/storage"
 "github.com/gruntwork-io/terratest/modules/azure"
 "github.com/gruntwork-io/terratest/modules/terraform"
 "github.com/stretchr/testify/assert"
)

func TestAzureStorageAccountAndContainer(t *testing.T) {
 t.Parallel()

 // Define the Terraform options with the desired variables
 terraformOptions := &terraform.Options{
  // The path to the Terraform code to be tested.
  TerraformDir: "../",

  // Variables to pass to our Terraform code using -var options
  Vars: map[string]interface{}{
   "environment": "test",
  },
 }

 // Deploy the Terraform code
 defer terraform.Destroy(t, terraformOptions)
 terraform.InitAndApply(t, terraformOptions)

 // Retrieve the Azure Storage account and container information using the Azure SDK
 storageAccountName := terraform.Output(t, terraformOptions, "storage_account_name")
 storageAccountGroupName := terraform.Output(t, terraformOptions, "resource_group_name")
 containerName := terraform.Output(t, terraformOptions, "container_name")

 // Authenticate using the environment variables or Azure CLI credentials
 azClient, err := azure.NewClientFromEnvironmentWithResource("https://storage.azure.com/")
 if err != nil {
  t.Fatal(err)
 }

 // Get the container properties
 container, err := azClient.GetBlobContainer(context.Background(), storageAccountGroupName, storageAccountName, containerName)
 if err != nil {
  t.Fatal(err)
 }

 // Check that the container was created with the expected configuration
 assert.Equal(t, "testcontainer", *container.Name)
 assert.Equal(t, "private", string(container.Properties.PublicAccess))

 fmt.Printf("Container %s was created successfully\n", containerName)
}
```

3. Run the test by navigating to the directory where the go file is saved and run the following command.

```hcl
go test -v
```


***

## Appendix: Links and References

*Note created on [[2023-06-07]] and last modified on [[2023-06-07]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[Terraform Testing Strategies]] AND -"CHANGELOG" AND -"//Terraform Testing Strategies"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2023

