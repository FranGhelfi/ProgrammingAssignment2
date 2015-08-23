## This set of functions evaluates the invertion of a created matrix.

## The first function caches a suplied matrix object. 

makeCacheMatrix <- function(x = matrix()) {
    
        ## First it checks if there is a previous value for the object.
        if (exists("myCacheMatrix") == "TRUE") {
            
            ## Then, it compares the new given matrix with the old one. If they
            ## are the same, it only updates the variable MatrixIs status to
            ## "Old".
            if (all(myCacheMatrix == x)) {
                
                MatrixIS <<- "Old"
            
            ## If the new given matrix is different from the last one, it caches
            ## the new matrix.
            } else {
                
                MatrixIS <<- "New"
                myCacheMatrix <<- x
                
            }
        
        ## If there isn´t a previus matrix to compare, it caches the new matrix.
        } else {
            
            MatrixIS <<- "New"
            myCacheMatrix <<- x
            
        }
    
}


## This function calculates the invertion of the source matrix if it´s new or
## reads the result from cache if it has allready been calculated.

cacheSolve <- function(x, ...) {
    
    ## If the matrix is new, it calculates the inversion.
    if (MatrixIS == "New" | exists("Result") == "FALSE") {
        
            Result <<- solve(myCacheMatrix)
            print("Did the calculation.")
            print(Result)
    
    ## If it´s old, it just retrieves the values from cache
    } else {
        
        print("Got it from Cache.")
        print(Result)
        
    }
    
    
}
