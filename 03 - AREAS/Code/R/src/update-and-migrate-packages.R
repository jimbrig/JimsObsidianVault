#From https://stackoverflow.com/questions/1401904/painless-way-to-install-a-new-version-of-r

# Run in the old version of R (or via RStudio)
setwd("C:/Temp/")
packages <- installed.packages()[,"Package"]
save(packages, file="Rpackages")

# INSTALL NEW R VERSION
if(!require(installr)) { install.packages("installr"); require(installr)} #load / install+load installr
# See here for more on installr: https://www.r-statistics.com/2013/03/updating-r-from-r-on-windows-using-the-installr-package/

# step by step functions:
check.for.updates.R() # tells you if there is a new version of R or not.
install.R() # download and run the latest R installer

# Install library - run in the new version of R. This calls package names and installs them from repos, thus all packages should be correct to the most recent version
setwd("C:/Temp/")
load("Rpackages")
for (p in setdiff(packages, installed.packages()[,"Package"]))
  install.packages(p)

# Installr includes a package migration tool but this simply copies packages, it does not update them
copy.packages.between.libraries() # copy your packages to the newest R installation from the one version before it (if ask=T, it will ask you between which two versions to perform the copying)


