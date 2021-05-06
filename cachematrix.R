Helps save time when working on large matrices whsoe values are fixed and unchanging. Caches the inverse
of the matrix so that the solve() calculation only need be done once.


The first function here creates a "matrix", which is actually really a list containing funtions to 
1. set the value of the matrix
2. get the value of the matrix
3. set the value of the inverse
4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() {x}
	setInverse <- function(inverse) {m <<- inverse}
	getInverse <- function() {m}
	list(set = set, get = get, 
		setInverse = setInverse, 
		getInverse = getInverse)
}


The second function calculates the inverse of the "matrix" created with the first function.
The if loop saves time by checking to see if the inverse had already been calculated, if so the inverse 
        is instead pulled from the cache.
        If there is no inverse value already recorded then the function calculates this value and stores
        in the cache with the setInverse function.

cacheSolve <- function(x, ...) {
	m <- x$getInverse() 
	if(!is.null(m)) {
		message("getting cached data")
		return(m)
	}
	mat <- x$get()
	m <- solve(mat, ...)
	x$setInverse(m)
	m
}
