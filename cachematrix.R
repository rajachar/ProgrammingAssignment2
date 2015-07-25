## = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
##
## Below are two functions that are used to create a special object that stores a numeric vector 
## and cache's its mean. 
##
## The first function, "makeCacheMatrix" creates a special "matrix" object that can "cache" its inverse
##
## This second function, "cacheSolve" computes the inverse of the special "matrix" returned by makeCacheMatrix above
##
## = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

## function - "makeCacheMatrix" 
## Creates a "matrix" object that can be used for caching whenever need arises 

makeCacheMatrix <- function(x = matrix()) {

}

##
## function - "cacheSolve" 
## Computes the inverse of the special "matrix" returned by function "makeCacheMatrix" and "caches" it.
## However, if the inverse has already been calculated (and the matrix object has not changed), then this function 
## should just merely retrieve the inverse from the "cache" rather than performing any new calculation(s)

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
