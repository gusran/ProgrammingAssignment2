## This is the solution for programming assigmnet 2
## The following code demonstrates how you can use lexical scoping to cache
## a value. The idea is that a lexical scope (closure) that contains the matrix 
## and a cache for the inverse of the matrix, by the function makeCacheMatrix.
## The function cacheSolve operates on this closure and manipulates the cache 
## in this lexical scoping. In this way a cache for the inverse of the matrix 
## is created.

## Creates a closure using lexical scoping with a matrix and a cache for its inverse
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  get <- function() x
  setinv <- function(i) inv <<- i
  getinv <- function() inv
  
  list(get = get, setinv = setinv, getinv = getinv)
}


## Returns the inverse of a cacheMatrix where the cache is used if it is set 
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  cache <- x$getinv()
  if(!is.null(cache)){
    message("Using cached result")
    return(cache)
  } else {
    x$setinv(solve(a = x$get(), ...))
    return(x$getinv())
  }
}
