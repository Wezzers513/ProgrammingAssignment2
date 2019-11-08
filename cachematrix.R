## The function is setting up the matrix by setting the value of the matrix and it's inverse as well as get the values of the 
## matrix and the inverse

## In this function I am assigning a value to an object using <<-

makeCacheMatrix <- function(x = matrix()) {
                inv <- NULL
                set <- function(y) {
                        x<<-y
                        inv<<- NULL
                        
                }
                get <- function() x
                setinverse <- function(inverse) inv <<-inverse
                getinverse <- function() inv
                list (set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## getting the inverse of the matrix for the above function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv<-x$getinverse()
        if(!is.null(inv)){
                message("getting cached data")
                return(inv)
        }
        data<-x$get()
        inv<-solve(data)
        x$setinverse(inv)
        inv
}

## To test if it gave it a result
mat<-matrix(c(1,3,5,7),2,2)
mat1<-makeCacheMatrix(mat)
cacheSolve(mat1)
