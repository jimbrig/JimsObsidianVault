library(urltools)
library(stringi)
library(tidyverse)
require(clipr)

# fairly comprehensive list of URL shorteners
shorteners <- read_lines("https://github.com/sambokai/ShortURL-Services-List/raw/master/shorturl-services-list.txt")

# opaque function baked into {tools}
# NOTE: this can take a while
db <- tools:::url_db_from_installed_packages(rownames(installed.packages()), verbose = TRUE)

as_tibble(db) %>%
  distinct() %>%  # yep, even w/in a pkg there may be dups from ^^
  mutate(
    scheme = scheme(URL), # https or not
    dom = domain(URL)     # need this later to be able to compute apex domain
  )  %>%
  filter(
    dom != "..", # prbly legit since it will be a relative "go up one directory"
    !is.na(dom)  # the {tools} url_db_from_installed_packages() is not perfect
  ) %>%
  bind_cols(
    suffix_extract(.$dom) # break them all down into component atoms
  ) %>%
  select(-dom) %>% # this is now 'host' from ^^
  mutate(
    apex = sprintf("%s.%s", domain, suffix) # apex domain
  ) %>%
  mutate(
    is_short = (host %in% shorteners) | (apex %in% shorteners) # does it use a shortener?
  ) -> db

db
## # A tibble: 12,623 x 9
##    URL        Parent    scheme host  subdomain domain suffix apex  is_short
##    <chr>      <chr>     <chr>  <chr> <chr>     <chr>  <chr>  <chr> <lgl>
##  1 https://g… albersus… https  gith… NA        github com    gith… FALSE
##  2 https://g… albersus… https  gith… NA        github com    gith… FALSE
##  3 https://w… AnomalyD… https  www.… www       usenix org    usen… FALSE
##  4 https://w… AnomalyD… https  www.… www       jstor  org    jsto… FALSE
##  5 https://w… AnomalyD… https  www.… www       usenix org    usen… FALSE
##  6 https://w… AnomalyD… https  www.… www       jstor  org    jsto… FALSE
##  7 https://g… AnomalyD… https  gith… NA        github com    gith… FALSE
##  8 https://g… AnomalyD… https  gith… NA        github com    gith… FALSE
##  9 https://g… AnomalyD… https  gith… NA        github com    gith… FALSE
## 10 https://g… AnomalyD… https  gith… NA        github com    gith… FALSE
## # … with 12,613 more rows

# what packages do i have installed that use short URLS?
# a nice thing to do would be to file a PR to these authors

filter(db, is_short) %>%
  select(
    URL,
    Parent,
    scheme
  )
## # A tibble: 5 x 3
##   URL                         Parent                   scheme
##   <chr>                       <chr>                    <chr>
## 1 https://goo.gl/5KBjL5       fpp2/man/goog.Rd         https
## 2 http://bit.ly/2016votecount geofacet/man/election.Rd http
## 3 http://bit.ly/SnLi6h        knitr/man/knit.Rd        http
## 4 https://bit.ly/magickintro  magick/man/magick.Rd     https
## 5 http://bit.ly/2UaiYbo       ssh/doc/intro.html       http

# what protocols are in use? (you'll note that some are borked and
# others got mangled by the {tools} function)

count(db, scheme, sort=TRUE)
## # A tibble: 5 x 2
##   scheme     n
##   <chr>  <int>
## 1 https  10007
## 2 http    2498
## 3 NA       113
## 4 ftp        4
## 5 `https     1

# what are the most used top-level sites?

count(db, host, sort=TRUE) %>%
  mutate(pct = n/sum(n))
## # A tibble: 1,108 x 3
##    host                      n     pct
##    <chr>                 <int>   <dbl>
##  1 docs.aws.amazon.com    3859 0.306
##  2 github.com             2954 0.234
##  3 cran.r-project.org      450 0.0356
##  4 en.wikipedia.org        220 0.0174
##  5 aws.amazon.com          204 0.0162
##  6 doi.org                 181 0.0143
##  7 wikipedia.org           132 0.0105
##  8 developers.google.com   114 0.00903
##  9 stackoverflow.com       101 0.00800
## 10 gitlab.com               86 0.00681
## # … with 1,098 more rows

# same as ^^ but apex

count(db, apex, sort=TRUE) %>%
  mutate(pct = n/sum(n))
## # A tibble: 743 x 3
##    apex                  n     pct
##    <chr>             <int>   <dbl>
##  1 amazon.com         4180 0.331
##  2 github.com         2997 0.237
##  3 r-project.org       563 0.0446
##  4 wikipedia.org       352 0.0279
##  5 doi.org             221 0.0175
##  6 google.com          179 0.0142
##  7 tidyverse.org       151 0.0120
##  8 r-lib.org           137 0.0109
##  9 rstudio.com         117 0.00927
## 10 stackoverflow.com   102 0.00808
## # … with 733 more rows

# See all the eavesdroppable, interceptable,
# content-mutable-by-evil-MITM-network-operator URLs
# A nice thing to do would be to fix these and issue PRs

filter(db, scheme == "http") %>%
  select(URL, Parent)
## # A tibble: 2,498 x 2
##    URL                                                 Parent
##    <chr>                                               <chr>
##  1 http://www.winfield.demon.nl                        antiword/DESCRIPTION
##  2 http://github.com/ropensci/antiword/issues          antiword/DESCRIPTION
##  3 http://dirk.eddelbuettel.com/code/anytime.html      anytime/DESCRIPTION
##  4 http://arrayhelpers.r-forge.r-project.org/          arrayhelpers/DESCRI…
##  5 http://arrow.apache.org/blog/2019/01/25/r-spark-im… arrow/doc/arrow.html
##  6 http://docs.aws.amazon.com/AmazonS3/latest/API/RES… aws.s3/man/accelera…
##  7 http://docs.aws.amazon.com/AmazonS3/latest/API/RES… aws.s3/man/accelera…
##  8 http://docs.aws.amazon.com/AmazonS3/latest/dev/acl… aws.s3/man/acl.Rd
##  9 http://docs.aws.amazon.com/AmazonS3/latest/API/RES… aws.s3/man/bucket_e…
## 10 http://docs.aws.amazon.com/AmazonS3/latest/API/RES… aws.s3/man/bucketli…
## # … with 2,488 more rows

# find the abusers of "http" URLs

filter(db, scheme == "http") %>%
  select(URL, Parent) %>%
  mutate(
    pkg = stri_match_first_regex(Parent, "(^[^/]+)")[,2]
  ) %>%
  count(pkg, sort=TRUE)
## # A tibble: 265 x 2
##    pkg                        n
##    <chr>                  <int>
##  1 paws.security.identity   258
##  2 paws.management          152
##  3 XML                      129
##  4 paws.analytics            78
##  5 stringi                   70
##  6 paws                      57
##  7 RCurl                     51
##  8 igraph                    49
##  9 base                      47
## 10 aws.s3                    44
## # … with 255 more rows

# send all the apex domains to the clipboard

clipr::write_clip(unique(db$apex))

# go here to paste them into the domain search box
# most domain/URL checker APIs aren't free for more
# than a cpl dozen URLs/domains

browseURL("https://www.bulkblacklist.com")

# paste what you clipped into the box and wait a while

gitlab.com
wikipedia.org
r-project.org
devroye.org
ethz.ch
jstatsoft.org
github.com
gegznav.github.io
rstudio.github.io
rstudio.com
yihui.name
basketballgeek.com
people.com.cn
archive.org
ted.com
sourceforge.net
pdflabs.com
uiuc.edu
imagemagick.org
graphicsmagick.org
cos.name
google.com
bit.ly
dri.edu
cmu.edu
ctan.org
swftools.org
ffmpeg.org
eddelbuettel.com
boost.org
xkcd.com
stackoverflow.com
ietf.org
dreamrs.github.io
apexcharts.com
rte-france.com
unhcr.org
jimhester.github.io
libarchive.org
pbiecek.github.io
r-bloggers.com
r-addict.com
msdn.com
marcinkosinski.github.io
sched.org
aau.dk
ue.poznan.pl
smarterpoland.pl
NA.NA
pedzlenie.github.io
python.org
columbia.edu
harvard.edu
mayoverse.github.io
bookdown.org
think-async.com
bitbucket.org
revolutionanalytics.com
gnu.org
cplusplus.com
ropensci.org
rpubs.com
thinkr-open.github.io
orcid.org
colinfay.me
rforge.net
amazon.com
awspolicygen.s3.amazonaws.com
microsoft.com
oauth.com
jwt.io
jwt.ms
example.com
docker.com
kubernetes.io
azure.com
rud.is
raindrop.io
apache.org
ibm.com
openlava.org
univa.com
schedmd.com
adaptivecomputing.com
doi.org
mllg.github.io
gmail.com
apple.com
man7.org
att.com
jumpingrivers.com
rockcontent.com
idvsolutions.com
hoelzel.at
zivatar.hu
theusrus.de
text-compare.com
youtu.be
ipcc.ch
nyti.ms
nationalarchives.gov.uk
jerrydallal.com
wikimedia.org
perceptualedge.com
websitetoolbox.com
varianceexplained.org
ncase.me
nabble.com
sdsu.edu
tu-dresden.de
catchment.org
wordpress.com
askubuntu.com
stackexchange.com
usgs.gov
eagereyes.org
sumatrapdfreader.org
gmx.de
raw.githubusercontent.com
debian.org
agner.org
utah.edu
markedmondson.me
r-lib.org
tidyverse.org
paleolimbot.github.io
r-dbi.org
rapidjson.org
bioconductor.org
nature.com
mailgun.com
gohugo.io
jekyllrb.com
hexo.io
docs.netlify.com
brew.sh
calibre-ebook.com
gitbook.com
pzhao.org
tidymodels.org
getbootstrap.com
sass-lang.com
bootswatch.com
mozilla.org
twitter.com
r-lib.github.io
mcmaster.ca
uni-koeln.de
xquartz.org
ams.org
statcan.ca
norc.org
vanderbilt.edu
encyclopedia-titanica.org
un.org
oecd.org
census-charts.com
csun.edu
spatialkey.com
topepo.github.io
amstat.org
otexts.org
appliedpredictivemodeling.com
mxnet.io
biomedcentral.com
arxiv.org
h2o.ai
freesoft.org
faqs.org
mcgill.ca
mathworks.com
wolfram.com
ssrn.com
variancejournal.org
casact.org
actuaries.org.uk
insurancedatascience.org
pbworks.com
uchicago.edu
rsnippets.blogspot.de
had.co.nz
mailchimp.com
ucsb.edu
servirglobal.net
nasa.gov
icmbio.gov.br
protectedplanet.net
hadley.nz
r-spatial.github.io
die.net
vergenet.net
travis-ci.org
formr.org
json-ld.org
rubenarslan.github.io
osf.io
schema.org
loc.gov
psyarxiv.com
codecheck.org.uk
codemeta.github.io
softwareheritage.org
nvie.com
purl.org
hclwizard.org
uibk.ac.at
ufrgs.br
colorbrewer2.org
carto.com
brucelindbloom.com
colourlovers.com
daattali.com
yaml.org
json.org
o2r.info
hash-archive.org
nsf.gov
nist.gov
kent.ac.uk
datavis.ca
rdocumentation.org
sthda.com
arelbundock.com
codecov.io
coveralls.io
llvm.org
wilkelab.org
springer.com
learncpp.com
cppreference.com
gweissman.github.io
rug.nl
helsinki.fi
princeton.edu
coursera.org
fluentcpp.com
isocpp.org
utf8everywhere.org
googlesource.com
r-hub.github.io
r-pkg.org
selbydavid.com
ikosmidis.com
conemu.github.io
cmder.net
git-scm.com
rubygems.org
haxx.se
hidemyass.com
bcgov.github.io
pacha.dev
rmhogervorst.nl
jsta.github.io
stedolan.github.io
stat-computing.org
cran.dev
cookiecentral.com
paulfitz.github.io
darksky.net
rdatatable.gitlab.io
cerebralmastication.com
reference.com
csvy.org
howardhinnant.github.io
postgresql.org
oracle.com
stereopsis.com
codercorner.com
medium.com
bts.gov
seanlahman.com
h2oai.github.io
r-hub.io
lkml.org
datascienceatthecommandline.com
ocks.org
htmlwidgets.org
graphviz.org
boxuancui.github.io
data-explorer.com
unixodbc.org
perl.org
hughes.com.au
utexas.edu
ox.ac.uk
sghms.ac.uk
mysql.com
cpan.org
bell-labs.com
wisc.edu
cvut.cz
sqlite.org
modern-sql.com
codecademy.com
jooq.org
talgalili.github.io
r-statistics.com
oup.com
stanford.edu
ucd.ie
nih.gov
tau.ac.il
appveyor.com
netlib.org
sourceforge.io
uoregon.edu
enst.fr
amstat-online.org
ioplex.com
schneier.com
aarongifford.com
zlib.net
burtleburtle.net
up.pt
yahoo.com
erudit.de
bhaskarvk.github.io
docker-py.readthedocs.io
docopt.org
NA.data
swapi.dev
noaa.gov
mastering-shiny.org
rstudio.org
monetdb.org
eddelbuettel.github.io
travis-ci.com
ghrr.github.io
datatables.net
komsta.net
duckduckgo.com
dygraphs.com
wu.ac.at
ntu.edu.tw
parigp-home.de
phdata.science
cdc.gov
colorbrewer.org
uni-kiel.de
pughtml.com
emoji-button.js.org
free.fr
youtube.com
ecma-international.org
data-imaginist.com
univ-lyon1.fr
krlmlr.github.io
r-sassy.org
hunch.net
umd.edu
robjhyndman.com
otexts.com
exponentialsmoothing.net
yangzhuoranyang.com
researchgate.net
sas.com
waikato.github.io
clicketyclick.dk
maptools.org
stata.com
epidata.dk
minitab.com
shinyapps.io
renkun-ken.github.io
glyphicons.com
w3.org
w3schools.com
greer.fm
rust-lang.org
acronis.com
npmjs.com
fstpackage.org
davisvaughan.github.io
opengroup.org
keras.io
gamlss.com
gamlss.org
ssc.ca
umn.edu
uc3m.es
quandl.com
jstatsoft.com
gapminder.org
www.googleapis.com
channable.com
googleapis.dev
globalrph.com
iana.org
geojson.org
ndjson.org
jsonlines.org
adc4gis.com
geojsonlint.com
dcooley.github.io
geonames.org
sf.net
edwilliams.org
movable-type.co.uk
mathforum.org
tech-archive.net
libgit2.org
opendata.aws
landsat-pds.s3.amazonaws.com
google-webfonts-helper.herokuapp.com
ggobi.github.io
briatte.github.io
guangchuangyu.github.io
openstreetmap.org
houstontx.gov
spatialanalysis.co.uk
stamen.com
stlouisfed.org
fueleconomy.gov
bids.github.io
berkeley.edu
tamu.edu
imdb.com
datanovia.com
slowkow.com
micahallen.org
thon.cc
austinwehrwein.com
nanx.me
material.io
mit.edu
miaozhu.li
ucsc.edu
circos.ca
d3js.org
locuszoom.org
broadinstitute.org
canva.com
makeadifferencewithdata.com
policyviz.com
jstor.org
cookbook-r.com
jrnold.github.io
highcharts.com
sron.nl
ethanschoonover.com
tableausoftware.com
stonesc.com
economist.com
spiekermann.com
fivethirtyeight.com
pinterest.com
twitpic.com
opm.gov
samba.org
www.netlify.com
giphy.com
carbon.now.sh
imgur.com
gepuro.net
julialang.org
thinkr.fr
r-pkgs.org
shinyproxy.io
mangothecat.github.io
juliasilge.com
walczak.org
donalphipps.co.uk
slack.com
cloudyr.github.io
www.freedesktop.org
cloudinit.readthedocs.io
mingw.org
manning.com
jottr.org
happygitwithr.com
w3id.org
ruby-lang.org
gmane.org
ucla.edu
genome.ad.jp
dkfz.de
sagebase.org
gupro.de
graphql.org
uiowa.edu
ucar.edu
gstat.org
minvenw.nl
bfs.de
52north.org
jku.at
gslib.com
worldbank.org
epa.gov
datadebrief.blogspot.com
quickanddirtytips.com
techtarget.com
rstats.wtf
uml.edu
statsci.org
jkunst.com
climate-lab-book.ac.uk
amcharts.com
elementary.io
materialui.co
tableau.com
wsj.com
andre-simon.de
hbiostat.org
livefreeordichotomize.com
christianrubba.com
r-datacollection.com
gforge.se
scb.se
pandoc.org
chromium.org
ascii.cl
thinkui.co.uk
acaps.org
ncsu.edu
bower.io
christophergandrud.github.io
sigmajs.org
gephi.org
enpiar.com
martinfowler.com
awsarchitectureblog.com
pretty-rfc.herokuapp.com
zapier.com
httpbin.org
tutsplus.com
jmarshall.com
requests.readthedocs.io
flickr.com
hunspell.github.io
aspell.net
utwente.nl
ubuntu.com
fedoraproject.org
gfycat.com
asana.com
igraph.org
rice.edu
hut.fi
aalto.fi
traag.net
uci.edu
keithbriggs.info
otago.ac.nz
schmuhl.org
jhu.edu
bu.edu
epfl.ch
dahtah.github.io
cimg.eu
r0k.us
scikit-image.org
chicagobooth.edu
ufl.edu
easystats.github.io
strengejacke.github.io
noamross.net
statmethods.net
lancs.ac.uk
nicebread.de
7-zip.org
cmake.org
lyx.org
miktex.org
xm1math.net
jrsoftware.org
java.net
notepad-plus-plus.org
johnmacfarlane.net
ipify.org
superuser.com
howtogeek.com
mbojan.github.io
yeastgenome.org
jupyter.org
irkernel.github.io
ipython.org
specifications.freedesktop.org
unicode.org
sil.org
gutenberg.org
sfirke.github.io
jquery.com
tumblr.com
standardjs.com
nodejs.org
data.world
usnews.com
mongodb.com
propublica.org
nytimes.com
json-schema.org
jacob-long.com
bbolker.github.io
cam.ac.uk
bc.edu
haozhu233.github.io
yihui.org
rdrr.io
netlify.app
tensorflow.org
toronto.edu
jmlr.org
uoguelph.ca
nvidia.com
deeplearning.net
openreview.net
vertex.ai
quora.com
nips.cc
ens.fr
ed.ac.uk
mpg.de
psu.edu
technion.ac.il
anu.edu.au
liacs.nl
rbind.io
crcpress.com
ashkenas.com
jimhester.com
ggplot2.org
mathjax.org
reaktanz.de
undocumeantit.github.io
kde.org
impact-information.com
ohchr.org
universaldependencies.org
uni-leipzig.de
mpi.nl
fu-berlin.de
uni-muenchen.de
citationstyles.org
creativecommons.org
strawberryperl.com
upenn.edu
gnuplot.info
matplotlib.org
larmarange.github.io
larmarange.net
retrosheet.org
baseball-reference.com
rdatasciencecases.org
in2013dollars.com
bayesball.blogspot.ca
gumroad.com
nd.edu
statsbylopez.com
fangraphs.com
wikibooks.org
bom.gov.au
washington.edu
census.gov
cancer.gov
nap.edu
edwardtufte.com
kkholst.github.io
lavaan.org
readscheme.org
keycode.info
gdal.org
geotiffjs.github.io
leafletjs.com
leaflet-extras.github.io
gadm.org
erikflowers.github.io
plos.org
tiscali.co.uk
smart-words.org
lexiconista.com
sentic.net
vidarholen.net
bannedwordlist.com
matthewjockers.net
umass.edu
bryer.org
liao961120.github.io
sparse-grids.de
cambridge.org
phdcomics.com
postgis.net
opengeospatial.org
geohash.org
gganimate.com
uic.edu
naturalearthdata.com
world-gazetteer.com
populationmondiale.com
utk.edu
computer.org
hawaii.edu
fs.fed.us
gstatic.com
uni-karlsruhe.de
szoraster.com
gpsbabel.org
markmonmonier.com
yorku.ca
wa.gov
bierwandern.de
europa.eu
bayern.de
daringfireball.net
repidemicsconsortium.org
metricsgraphicsjs.org
thug-r.life
bls.gov
xmind.net
micecon.org
mlr-org.com
wikispaces.com
unipd.it
wsu.edu
utoronto.ca
nlsinfo.org
rit.edu
masalmon.eu
speakerdeck.com
statnet.org
uni-lj.si
ref.ac.uk
meccanismocomplesso.org
rawgit.com
asahq.org
signll.org
uantwerpen.be
nltk.org
uib.no
scholarpedia.org
cnsgenomics.com
ssldecoder.org
openssl.org
openbsd.org
ycphs.github.io
webfx.com
csgillespie.github.io
waterbutler.io
theoj.org
zuckarelli.de
talkstats.com
tug.org
overleaf.com
ghostscript.com
rapporter.github.io
rapport-package.info
u-tokyo.ac.jp
slideshare.net
rapporter.net
brendangregg.com
pbdr.org
zeromq.org
ncftp.com
poppler.freedesktop.org
zenodo.org
pinboard.in
webdatarocks.com
nactem.ac.uk
purgomalum.com
realfavicongenerator.net
fontawesome.com
algolia.com
ogp.me
afeld.github.io
nillia.ms
plotly-r.com
plotly.com
plot.ly
state.mn.us
cpsievert.me
rplumber.io
libsodium.org
openapis.org
ozean12.github.io
baseball-databank.org
polished.tech
angusj.com
acm.org
sindresorhus.com
statr.me
csscompressor.com
katex.org
expasy.org
google.ch
graphviz.gitlab.io
gperftools.github.io
projecttemplate.net
kirill-mueller.de
johnmyleswhite.com
personality-project.org
sapa-project.org
icar-project.org
sciencedirect.com
sagepub.com
northwestern.edu
haskell.org
scala-lang.org
underscorejs.org
lodash.com
danieltao.com
renkun.me
regexper.com
measham.id.au
debuggex.com
matthewflickinger.com
rexegg.com
regexlib.com
mathiasbynens.be
iau.org
quanteda.io
oireachtas.ie
kenbenoit.net
snsoroka.com
provalisresearch.com
liwc.net
conjugateprior.org
aclweb.org
influentialpoints.com
mq.edu.au
ed.gov
apa.org
tandfonline.com
ucf.edu
osu.edu
dtic.mil
hashtags.org
tartarus.org
iso.org
spacy.io
wpengine.com
quantmod.com
oanda.com
alphavantage.co
tiingo.com
yahoo.co.jp
omegahat.net
undocumentedmatlab.com
fsu.edu
aroma-project.org
tuwien.ac.at
devtidbits.com
ss64.com
wotsit.org
tcl-lang.org
square.github.io
d3indepth.com
dashingd3js.com
vida.io
randomapi.com
centerforassessment.github.io
dbetebenner.github.io
ploum.net
standards.freedesktop.org
rspatial.org
worldclim.org
cgiar.org
diva-gis.org
spatialreference.org
kaggle.com
datacamp.com
rbenchmark.googlecode.com
clipboardjs.com
rcpp.org
open-std.org
eigen.tuxfamily.org
rcppcore.github.io
openmp.org
toml.io
sitepoint.com
ucdavis.edu
parosproxy.org
ademar.name
NA.help
oreilly.com
doxygen.nl
glin.github.io
facebook.github.io
yarnpkg.com
babeljs.io
webpack.js.org
borisyankov.github.io
casesandberg.github.io
reactjs.org
jsinr.me
react-r.github.io
icu-project.org
tufts.edu
mitre.org
talosintelligence.com
codeplex.com
scikit-learn.org
tidymodels.github.io
ouhsc.edu
project-redcap.org
hrsa.gov
ok.gov
okdhs.org
grantome.com
oumedicine.com
ouhscbbmc.github.io
readthedocs.org
getpostman.com
atom.io
visualstudio.com
redcap-tools.github.io
projectredcap.org
sburns.org
openrefine.org
pregi.net
crossref.org
lukehaas.me
atlassian.com
curl.se
engineering-shiny.org
discourse.org
discogs.com
sharla.party
anapioficeandfire.com
swapi.co
conda.io
conda-forge.org
pypa.io
altair-viz.github.io
osgeo.org
asdar-book.org
esri.com
lin-ear-th-inking.blogspot.com
geotools.org
ogc.org
jrowen.github.io
handsontable.com
numbrojs.com
omnipotent.net
numeraljs.com
driven-by-data.net
ropenscilabs.github.io
gitter.im
introjs.com
lbraglia.github.io
stattransfer.com
mtna.us
kiva.org
racket-lang.org
r-prof.github.io
openweathermap.org
contextgarden.net
codepoints.net
caniuse.com
libreoffice.org
rstudio.cloud
cochrane.org
mariadb.org
wiley.com
kuleuven.be
ipa-tys.github.io
waikato.ac.nz
reddit.com
vimeo.com
commonmark.org
smartinsightsfromdata.github.io
kruchten.com
rabbitmq.com
2ndquadrant.com
todoist.com
repostatus.org
selectorgadget.com
flukeout.github.io
pythonhosted.org
brucelawson.co.uk
queensu.ca
css-tricks.com
richfinelli.com
goo.gl
nrel.gov
pancroma.com
gisagmaps.com
tpu.ru
environmentalinformatics-marburg.de
moz.com
bing.com
startpage.com
bitbucket.com
itsalocke.com
robertmitchellv.com
ixquick.com
monash.edu
sjp.co.nz
cssselect.readthedocs.io
auckland.ac.nz
statmodel.com
quantpsy.org
davidakenny.net
semver.org
feedly.com
uservoice.com
r-spatial.org
locationtech.github.io
gaia-gis.it
refractions.net
proj4.org
s2geometry.io
orgmode.org
mmaechler.blogspot.ch
fontawesome.io
bootstrap-datepicker.readthedocs.io
fomantic-ui.com
deanattali.com
attalitech.com
paypal.me
ebailey78.github.io
notiflix.com
epicmax.co
tobiasahlin.com
rinterface.com
adminlte.io
rinterface.github.io
divadnojnarg.github.io
codeseven.github.io
fatcow.com
xscode.com
burgerga.github.io
surge.sh
autonumeric.org
atomiks.github.io
sweetalert2.github.io
refreshless.com
snapappointments.com
lokesh-coder.github.io
bgrins.github.io
t1m0n.name
wenq.org
garrickadenbuie.com
skype.com
hertzen.com
yp.to
namazu.org
edzer.github.io
jhsph.edu
macromedia.com
spotify.com
genius.com
libssh.org
rmetrics.org
american.edu
mc-stan.org
wehi.edu.au
richfitz.github.io
upf.edu
digitalclassicist.org
snowballstem.org
archives.gov
gagolewski.com
unicode-org.github.io
regular-expressions.info
amzn.com
wkhtmltopdf.org
tympanus.net
sarasoueidan.com
swagger.io
systemfit.org
nyu.edu
saifmohammad.com
cubic.org
obeautifulcode.com
ro-che.info
jestjs.io
storage.googleapis.com
theatlantic.com
etherealbits.com
handle.net
mmds.org
matthewcasperson.blogspot.com
lincolnmullen.com
enricoschumann.net
whatwg.org
rosettacode.org
mongodb.org
jsonstudio.com
waxy.org
fishsciences.github.io
pewforum.org
who.int
winvector.github.io
walker-data.com
ugent.be
lextek.com
tidytextmining.com
stanfordnlp.github.io
juliasilge.github.io
dublincore.org
winfield.demon.nl
xpdfreader.com
happyplanetindex.org
cbs.nl
kadaster.nl
robinlovelace.net
color-blindness.com
tmb-project.org
yale.edu
federalreserve.gov
comp-engine.org
fmlabs.com
metastock.com
linnsoft.com
stockcharts.com
financial-hacker.com
investopedia.com
traderslog.com
nasdaqtrader.com
easings.net
hexdump.org
longapi.org
urbandictionary.com
bipm.org
ku.dk
ecb.int
ucsd.edu
pfaffikus.de
publicsuffix.org
mybinder.readthedocs.io
mybinder.org
circleci.com
choosealicense.com
contributor-covenant.org
dropbox.com
jenkins.io
hexb.in
joelonsoftware.com
v8.dev
cdnjs.com
jsdelivr.com
browserify.org
data-cleaning.github.io
w3schools.io
datastorm-open.github.io
fortawesome.github.io
ionicons.com
visjs.org
chriswhong.com
w3c.github.io
sckott.github.io
casperjs.org
gaborcsardi.org
npr.org
dinbror.dk
fellstat.com
libxlsxwriter.github.io
remarkjs.com
fandom.com
xmlsoft.org
jclark.com
sagehill.net
oasis-open.org
tex.ac.uk
state.tx.us
pyyaml.org
r12a.github.io
qsl.net
pcre.org
bzip.org
tukaani.org
hiroshima-u.ac.jp
htmlpreview.github.io
launchpad.net
dotat.at
ssfpack.com
sidc.be
labri.fr
adobe.com
cairographics.org
x.org
schmidt-web-berlin.de
hhs.gov
und.edu
menzies.edu.au
llnl.gov
bendixcarstensen.com
tkdocs.com
invisible-island.net
hmc.edu
