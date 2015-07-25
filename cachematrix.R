## = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
##
## Below are two functions that are used (in its combination) to create a 
## special "matrix" object, calculate its inverse (matrix inverse), save
## ("cache") the same as a variable if it is a new object (i.e, should the
## object be created for the first time), or to merely retrieve it from 
## cache if the object already exists. (Without having to redo all the 
## calculations again). 
##
## The first function, "makeCacheMatrix" mainly creates an o/p "list" of 4 
## (four) functions, that are small, inter related executable tasks, viz,
##
## (1) getmat_x : To get the matrix requirement via the argument 
##                value passed by the main function and merely pass
##                it on to other functions.
## (2) setmat_x : This function will not normally be required, unless the
##                value of the input matrix is required to be changed 
##                in the middle. And when gets executed, it assigns (sets)
##                value to variable "outside" of the "current environment". 
##                Which can be accessed by other calling functions.
## (3) setmat_inv & 
## (4) setmat_inv are functions that are similar to the above two, in that,
##                they do not perform any calculations other than setting
##                and passing variable values.
##                
## The second function, "cacheSolve" either retrieves the result from a 
## previously performed calculation (operation), or caculates the inverse of
## a given matrix object and saves ("caches") them in a global environment
## outside of the "current or local environ" - for subsequent access/use.
##
## = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

## function - "makeCacheMatrix" 
## 
    makeCacheMatrix <- function(x = matrix()) {
##
##
    matrix_inv <- NULL
    setmat_x = function(y) {

        x <<- y                 # Symbol '<<-' used in set to manipulate
        matrix_inv <<- NULL     # objects outside of current environment
    }
    getmat_x = function() x     # Just merely pass on the arg to other funcs 
##
    setmat_inv = function(inverse)  matrix_inv <<- inverse
##
    getmat_inv = function() matrix_inv
##
    list(getmat_x = getmat_x, setmat_x = setmat_x,         # Creates output 
         setmat_inv = setmat_inv, getmat_inv = getmat_inv) # list of funcs
}
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##
## function - "cacheSolve" 
##
## Computes the inverse of the special "matrix" returned by function 
## "makeCacheMatrix" and "caches" it. However, if the inverse has already 
## been calculated - then this function should just merely retrieve the 
## inverse from the "cache" rather than performing any new calculation(s)

    cacheSolve <- function(x, ...) {
##
##
    matrix_inv <- x$getmat_inv()
##
    if(!is.null(matrix_inv)) {
        message("getting cached data")  # Info message when object in cache
        return(matrix_inv)
    }
##
## If the above is TRUE, i.e, the matrix object already exists, the function 
## exits here to return back to the caller with the object just found.
##
## Code continues execution beyond this point if the obj is not found (NULL) 
## 
    matrix_x <- x$getmat_x()            # Get the input matrix object
##
    matrix_inv <- solve(matrix_x, ...)  # Calculate the inverse of matrix
##
    x$setmat_inv(matrix_inv)            # Set the object variable
##
    return(matrix_inv)                  # exit with inverse of the matrix
}

