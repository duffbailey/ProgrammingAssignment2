## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##  makeCacheMatrix first initializes the two global objects
##  - x and i which are used to contain the matrix and its inverse
##   It then defines the behavior of the 4 functions that 
##  get and set the matrix and its inverse and returns 
##  these functions in a list.
makeCacheMatrix <- function(x = matrix()) {
##  set the value of the matrix
  i <- NULL
  set <-function(y) {
    x <<- y
    i <<- NULL
  }
##  get the value of the matrix
  get <- function()  x
##  set the value of the inverse matrix
  setinverse <- function(solve) i <<- solve
##  get the value of the inverse matrix
  getinverse <- function() i
      list(set=set, get=get,
           setinverse = setinverse,
           getinverse = getinverse)
}


## Write a short comment describing this function
## cachesolve takes a matrix and uses the functions of 
##  makeCacheMatrix to create and cache an inverse of a matrix OR 
##  or simply retrive the cached version if it has already been created
cachesolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(! is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data,...)
  x$setinverse(i)
  i
}
