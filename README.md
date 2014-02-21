pings
=====

pings for all %.% user 
## Installation
You need to install dependents before installing pingr.

```r
install.packages("devtools")
library(devtools)
install.packages("dplyr")
install_github("rasmusab/pingr")

install_github("dichika/pings")
```

Note: Windows users need [Rtools](http://www.murdoch-sutherland.com/Rtools/) and [devtools](http://CRAN.R-project.org/package=devtools) to install this way.

## Usage
Just do it.
```r
library(pings)
pings(iris %.%
       group_by(Species) %.%
       summarise(count=n()) %.%
        tally()
      )
```
