## Course Project for Coursera: Getting and Cleaning Data
### 2015-March
#### Rob Rolleston (rob.rolleston@xerox.com)
#### github: https://github.com/RobRolleston


Here is a list

1.  set the value of the vector
2.  get the value of the vector
3.  set the value of the mean
4.  get the value of the mean

Here is some code
<!-- -->

    makeVector <- function(x = numeric()) {
            m <- NULL
            set <- function(y) {
                    x <<- y
                    m <<- NULL
            }
            get <- function() x
            setmean <- function(mean) m <<- mean
            getmean <- function() m
            list(set = set, get = get,
                 setmean = setmean,
                 getmean = getmean)
    }

	
And this is the end