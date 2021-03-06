#This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function( m = matrix() ) {
  i <- NULL
  set <- function( matrix ){
    m <<- matrix
    i <<- NULL
  }
  get <- function() {
    m
  }
  setInverse <- function() {
    i <<- inverse
  }
  getInverse <- function() {
    i
  }
  list(set = set, 
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 

  cacheSolve <- function(x, ...) {
    m <- x$getInverse()
    if(!is.null(m)) {
      message("gettin cached data")
      return(m)
    }
    data <- x$get()
    m <- solve(data) %% data
    x$setInverse(m)
    m
  }
