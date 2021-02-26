## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

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
