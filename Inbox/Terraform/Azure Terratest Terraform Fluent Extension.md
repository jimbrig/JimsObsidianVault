---
Date: 2023-05-20
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: [ "#Type/Code", "#Topic/Dev" ]
Alias: [ ]
---

# Azure Terratest Terraform Fluent Extension

> [!SOURCE] Source:
> *[Azure/terratest-terraform-fluent: Go module for Terraform module testing with fluent assertions (github.com)](https://github.com/Azure/terratest-terraform-fluent)*

## Overview

`terratest-terraform-fluent` is a [[Terratest]] extension package for testing [[Terraform]] code with *fluent* assertions.

*Created by the Azure team.*

idiomatic


## Usage

```hcl
package test

import (
  "testing"

  "github.com/Azure/terratest-terraform-fluent/check"
  "github.com/Azure/terratest-terraform-fluent/setuptest"
  "github.com/stretchr/testify/require"
)

const (
  moduleDir = "../"
)

func TestSomeTerraform(t *testing.T) {
  // Set up the Terraform test and run terraform init, plan and show,
  // saving the plan output to a struct.
  // The returned struct in tftest contains the temp dir, the plan struct,
  // the terraform options, and the clean up func.
  //
  // The Dirs inputs are the test root directory and the relative path to the test code.
  // (this must be a subdirectory of the test root directory).
  // The WithVars inputs are the Terraform variables to pass to the test.
  // The InitPlanShow input is the testing.T pointer.
  tftest, err := setuptest.Dirs(moduleDir, "").WithVars(nil).InitPlanShow(t)
  require.NoError(t, err)
  defer tftest.Cleanup()

  // Check that the plan contains the expected number of resources.
  check.InPlan(tftest.Plan).NumberOfResourcesEquals(1).ErrorIsNil(t)

  // Check that the plan contains the expected resource, with an attribute called `my_attribute` and
  // a corresponding value of `my_value`.
  check.InPlan(tftest.Plan).That("my_terraform_resource.name").Key("my_attribute").HasValue("my_value").ErrorIsNil(t)

  // Check that the plan contains the expected resource, with an attribute called `my_complex_attribute` and
  // a gjson query in a list called `mylist`, taking the first element, which is an object with a property
  // called `property`, with a value of `my_value`.
  //
  // https://github.com/tidwall/gjson/blob/master/SYNTAX.md
  check.InPlan(tftest.Plan).That("my_terraform_resource.name").Key("my_complex_attribute").Query("mylist.0.property").HasValue("my_value").ErrorIsNil(t)
  defer tftest.Destroy(t)
  tftest.ApplyIdempotent(t).ErrorIsNil(t)
}
```


