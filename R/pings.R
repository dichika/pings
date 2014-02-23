pings <- function(x, interval=0.25, countp=2, endp=8){
  require(dplyr)
  require(pingr)
  res <- substitute(x) %.% paste(collapse="") %.% gregexpr(pattern="%.%") %.% unlist()
  time <- res %.% length()
  if(res[1] != -1){
    tryCatch({
      eval(x)
    },
    error = function(e){
      message(e)
      stop(call.=FALSE, domain=NA)
    })
    i <- 0
    repeat {
      if (i < time){
        i <- i+1
        ping(countp)
        Sys.sleep(interval)
      }else{
        Sys.sleep(interval)
        ping(endp)
        Sys.sleep(interval)
        break
      }
    }
    if(time>=5){
           cat(sprintf("\n\n!!!!! %s Hits Combo !!!!!\n!!!!! Excellent !!!!!\n", time))
    } else if(time>=2){
      cat(sprintf("\n\n!!!!! %s Hits Combo !!!!!\n!!!!! Good !!!!!\n", time))      
    } else 
      cat(sprintf("\n\n      Only %s Hit :( \n\n", time))
} else {
    return(eval(x))
}}