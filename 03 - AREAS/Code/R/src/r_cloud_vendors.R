pak::pak("Azure/Microsoft365R")
pak::pak("Azure/AzureAuth")
pak::pak("Azure/AzureRMR")
pak::pak("Azure/AzureKeyVault")
pak::pak("Azure/AzureContainers")
pak::pak("MarkEdmondson1234/googleAuthR")
pak::pak("MarkEdmondson1234/bigQueryR")
pak::pak("MarkEdmondson1234/googleAnalyticsR")
pak::pak("MarkEdmondson1234/googleCloudRunner")
pak::pak("cloudyr/googleCloudStorageR")
pak::pak("cloudyr/googleCloudVisionR")
pak::pak("cloudyr/gcloudR")
pak::pak("googleCloudRunner")
pak::pak('IronistM/googleTagManageR')
pak::pak("firebase")
pak::pak("searchConsoleR")
pak::pak("googleComputeEngineR")
pak::pak("cronR")

library(googleAuthR)

api_df <- gar_discovery_apis_list()

api_json_list <- mapply(gar_discovery_api, api_df$name, api_df$version)

## takes about 90 mins to run through them all
result <- lapply(api_json_list,
                 gar_create_package,
                 directory = "/Users/mark/dev/R/autoGoogleAPI",
                 github = FALSE,
                 overwrite = FALSE)

install.packages("bigQueryR", repos = c(getOption("repos"), "http://cloudyr.github.io/drat"))

library(Microsoft365R)
library(AzureAuth)
Microsoft365R::personal_onedrive()

od <- personal_onedrive()
od$list_items()
# od$download_file()
# od$upload_file()
# od$create_folder()

library(AzureContainers)
AzureRMR::create_azure_login(auth_type = "device_code")

AzureRMR::get_azure_login()

AzureAuth::get_azure_token(
  resource = ""
)
