## = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
##
## Below are two functions that are used (in its combination) to create a special "matrix" object, calculate its inverse
## (matrix inverse), save to "cache" the same as a variable if it is a new object (i.e, should the object be created 
## for the first time), and merely retrieve it from cache if the object already exists. (without having to redo the same)
##
## The first function, "makeCacheMatrix" creates a special "matrix" object that can "cache" its inverse
##
## This second function, "cacheSolve" computes the inverse of the special "matrix" passed by makeCacheMatrix above
##
## = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

## function - "makeCacheMatrix" 
## Creates a "matrix" object that can be used for caching whenever need arises 

makeCacheMatrix <- function(x = matrix()) {
##
##
##
        setmat_x = function(y) {
                # use `<<-` to assign a value to an object in an environment 
                # different from the current environment. 
                x <<- y
                matrix_inv <<- NULL
        }
        getmat_x = function() x
        setmat_inv = function(inverse)  matrix_inv <<- inverse 
        getmat_inv = function()  matrix_inv
        list(setmat_x = setmat_x, getmat_x = getmat_x, setmat_inv = setmat_inv, getmat_inv = getmat_inv)
}
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##
## function - "cacheSolve" 
## Computes the inverse of the special "matrix" returned by function "makeCacheMatrix" and "caches" it.
## However, if the inverse has already been calculated (and the matrix object has not changed), then this function 
## should just merely retrieve the inverse from the "cache" rather than performing any new calculation(s)

cacheSolve <- function(x, ...) {
##
## Return a matrix that is the inverse of 'x'
##
        matrix_inv <- x$getmat_inv()
        if(!is.null(matrix_inv)) {
           message("getting cached data")   # Put out an information message to denote that the object is from cache
           return(matrix_inv)
        }
##
## If the above is TRUE, i.e, the matrix object already exists, the function exits at this point and returns back 
## to the caller with the object just found.
##
## Code continues execution beyond this point if the object is not found (or is NULL). 
##
matrix_x <- x$getmat_x()                # Get the input matrix object
matrix_inv <- solve(matrix_x, ...)      # Calculate the inverse of matrix 
x$setmat_inv(matrix_inv)                # Set the object variable  
return(matrix_inv)                      # return / exit out of the function call with the inverse of the matrix
}

