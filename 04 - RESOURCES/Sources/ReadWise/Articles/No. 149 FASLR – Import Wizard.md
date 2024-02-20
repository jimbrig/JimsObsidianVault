---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://genedan.com/no-149-faslr-import-wizard/
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - "No. 149: FASLR – Import Wizard"
  - "No. 149: FASLR – Import Wizard"
---
# No. 149: FASLR – Import Wizard

## Metadata
- Author: [[Gene Dan]]
- Full Title: No. 149: FASLR – Import Wizard
- Category: #Type/Highlight/Article
- URL: https://genedan.com/no-149-faslr-import-wizard/

## Highlights
- Until now, there hasn’t been a way to load external data into FASLR, besides altering the source code to make that happen. Most of what you see in my previous posts on FASLR are examples that can be found in the repo’s demos folder, and illustrate some of program’s existing features on dummy data from actuarial papers. Actually, there still isn’t a way for the user to get data into FASLR, as this post is about the Import Wizard, and not about what happens to the data after you press the ‘OK’ button – that will have to wait for another time. ([View Highlight](https://read.readwise.io/read/01gt8fq168ppr3jwkp0ee78e3x))
- Ideally, in-house reserving systems ought to be connected to the company’s loss database, and data should be automatically fed into the system at regular intervals (monthly, quarterly, etc.), negating the need for a manual import wizard to get data into the program. That’s rarely the case however, and even departments that are pretty good at automating that kind of thing will still have the need for their employees to manually insert data in the situations where such automation falls short – such as copying and pasting numbers from Excel or uploading external CSV files. Thus, I decided some kind of import wizard was necessary. ([View Highlight](https://read.readwise.io/read/01gt8fr1w35ax6p0h8xx2wfnxn))
- The import wizard has two tabs – one for mapping the external data to its internal FASLR representation, and another to preview the resulting triangle prior to upload. These are labeled “Arguments” and “Preview”, respectively. ([View Highlight](https://read.readwise.io/read/01gt8frqzg8746zn9w5nxjkgv5))
- The arguments tab has four main sections:
  • File Upload
  • Header Mapping
  • Measure
  • File Data
  The file upload section lets you select a CSV file for import. It has an upload button to the left, a text box in the middle to hold the file path, and two buttons to the right to cancel and refresh the form. ([View Highlight](https://read.readwise.io/read/01gt8fs7qcgkv4gfw530n6bern))
- The header mapping section is what allows the user to map the CSV fields, say, “Paid Losses” and “Accident Year” to the triangle fields used by FASLR. ([View Highlight](https://read.readwise.io/read/01gt8fsb5rqna7mh0z8fkn5as3))
- The measure section just indicates whether the triangle should be cumulative or incremental. Most triangles encountered by actuaries are cumulative, so I’ve made that the default. I agonized over what to call this section, since I don’t think there’s a commonly accepted word that actuaries use to describe whether a triangle is cumulative or incremental. “Cumulativeness” or “incrementalness” just sounds weird, so I called the section “measure”, which is subject to change if I or someone else finds something better. ([View Highlight](https://read.readwise.io/read/01gt8fscqs0h8gd7mq3556jpp4))
- The file data section lets the user view the data in the CSV file, to assist them with mapping the fields. ([View Highlight](https://read.readwise.io/read/01gt8fsg84f1925cg9d1fa7r6k))
- Uploading files is as simple as it gets. You click the upload button, and then the wizard reads in the data and displays it in the File Data section on the bottom. The file headers are read and are then provided as options to map to the triangle fields. ([View Highlight](https://read.readwise.io/read/01gt8fsnjd0cd8m0say2jypm4c))
- The next step is to map the CSV headers to the triangle fields. In chainladder, this is done by providing arguments to the data, origin, development, columns, and cumulative parameters to the Triangle class: ([View Highlight](https://read.readwise.io/read/01gt8fsy0sr1ry2deja5hy8d79))
- The user can also select the number of value columns to be used for the triangle by clicking the “+” and “-” buttons – for example, if the data file has both paid and reported losses, you can increase the number of columns to account for this. ([View Highlight](https://read.readwise.io/read/01gt8ftdx76pqvswgzvr7knn77))
- Once the mapping is done, the user can preview the generated triangle by clicking on the “Preview” tab. This tab is populated by the same analysis widget discussed in my last post. ([View Highlight](https://read.readwise.io/read/01gt8fthwc463bzzjqx2b50s1z))
