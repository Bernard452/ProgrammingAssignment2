## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix create a list of functions and store the matrix value inside (m)
## then cacheSolve is use to check the value of m.
## If m is not NULL it's mean the inverted matrix was previosli calculed

## Write a short comment describing this function

## makeCacheMatrix create a list with four fonctions :
## Set : value assignement
## Get : return value
## Setinverse : inverse matrix calculation
## Get nverse : return value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        
        ## Set function : affect value to the matrix
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        
        ## Get function : return the matrix value
        get <- function() x
        
        ## Setinverse function : calulate the inverse matrix
        setinverse <- function(solve) m <<- solve
        
        ## Getinverse function : return the inverse matrix value
        getinverse <- function() m
        
        ## Create list of the four functions
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Write a short comment describing this function

## If the inse matrix value was not calculated , we calculate the value,
## otherwise we return the value previously calculated.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        
        ## if inverted matrix existe m is not null
        if(!is.null(m)) {
                message("cache hit")
                ## so we return the cached value
                return(m)
        }
        
        ## Inverted matrix was never calculed
        ## we get the matrix value
        data <- x$get()
        
        ##  and we calculate the inverse matrix
        m <- solve(data, ...)
        x$setinverse(m)
        
        ## and we return the value
        m
        ## Return a matrix that is the inverse of 'x'
	
}
