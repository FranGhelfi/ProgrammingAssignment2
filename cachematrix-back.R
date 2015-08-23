## This set of functions evaluates the invertion of a created matrix.

## The first function creates a matrix object. It can randomly generate new values
## for the matrix or keep existing ones. I did this with the intention to test 
## both posible situations (calculate new or get from cache) in the cacheSolve function.

makeCacheMatrix <- function(x = matrix()) {
    
    ## First it generates random options between 1 or 2.
    if (sample(1:2, 1) == 1){
        
        ## OPtion 1 generates a matrix with random values in cache.
        MatrixIS <<- "New"
        myCacheMatrix <<- matrix(rnorm(16),4,4)
        
    } else {
        
        ## IN option 2, first it tests if the matrix allready exists.
        if (exists("myCacheMatrix")){
            
            ## In this case, it keeps the existing matrix values.
            MatrixIS <<- "Old"
            myCacheMatrix <<- myCacheMatrix
            
        } else {
            
            ## If the matrix doesn´t exist because this is the first time you 
            ## run the function it generates a matrix with random values.
            MatrixIS <<- "New"
            myCacheMatrix <<- matrix(rnorm(16),4,4)
        }
        
    }
    
   
    
}


## This function calculates the invertion of the source matrix if it´s new or
## reads the result from cache if it has allready been calculated.

cacheSolve <- function(x, ...) {
    
    ## First it generates the source matrix using the makeCacheMatrix function.
    myCacheMatrix <- makeCacheMatrix()
    
    ## If the matrix is new, it calculates the inversion.
    if (MatrixIS == "New" | exists("Result") == "FALSE") {
        
        ## Before calculating the inversion, it tests if the matrix is
        ## invertible. With this action it avoids calculation nullity.
        if (det(myCacheMatrix) == "0") {
            
            print("The source matrix is singular, it can´t be inverted.
                  Please run the function again.")
        
        ## If the matrix is actually invertible, it does the calculation.    
        } else {
            
            Result <<- solve(myCacheMatrix)
            print("Did the calculation.")
            print(Result)
        }
       
        
    } else {
        
        print("Got it from Cache.")
        print(Result)
        
    }
    
    
}
