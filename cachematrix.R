## Cachematrix.R two functions makeCacheMatrix() and cachesolve(). The funtion makeCacheMatrix() creates and stores a matrix object and its inverse in another environment. The cachesolve() function uses the first function to retrieve the inverse of a matrix if it has been calculated before and stored. If it is not there it calculate the inverse and returns and  also passes it to makeCacheMatrix() for storage.

## To cache the inverse, makeCacheMatrix() builds a set of functions to set and get the input matrix "x" using set() and get() and set and get the inverse "im" using setinverse() and getinverse(). 

makeCacheMatrix <- function(x = matrix()) {
	im <- NULL
	set <- function(y) {
		x <<- y
		im <<- NULL  
	}
   get <- function() x
   setinverse <- function(solve) im <<- solve
   getinverse <- function() im
   list(set=set, get=get, setinverse=setinverse, getinverse=getinverse) 
}


## cacheSolve retrieves the cached inverse "im" if is stored by makeCacheMatrix(). if not, it computes the inverse and returns the value as well setting the new im value

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        im <- x$getinverse()
        if(!is.null(im)) {
        	message("getting cached data")
        	return(im)
        }
        data <- x$get()
        im <- solve(data, ...)
        x$setinverse(im)
        im
}
