## These 2 functions can be used to create matrix objects with the inverse cached for easy access. 

## This function creates an object along wiht 4 functions that can be used to call the value, 
## set the value, and get and set the inverse of the matrix given as argument. 

makeCacheMatrix <- function(x = matrix()) {
inverse <- NULL
set <- function(y) {
  x <<- y
  inverse <<- NULL  
}
get <- function() x
getinverse <- function() inverse
setinverse <- function(inv) inverse <<- inv
list(set = set, get = get, getinverse = getinverse, setinverse = setinverse)
  
}


## This function tests if the inverse has already been calculated 
## if so, it returns this value, if not, it calculates it and stores it in the object 
## passed as argument. It finally returns the inverted matrix passed as argument.

cacheSolve <- function(x=matrix(), ...) {
        inv <- x$getinverse()
        if(!is.null(inv)){
          message("getting cached data")
          return (inv) #return(inv) returns the value and skips the rest of the function
        }
      matrix <- x$get()
      inv <- solve(matrix,...)
      x$setinverse(inv)
      inv
}
