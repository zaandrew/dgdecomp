#' @rdname Func_Inner_Sum
#'
#' @export
#'
Func_Inner_Sum_Matx <- function(P, vec_x, vec_y, cpplib) {
  return(
    if (cpplib == 'arma') {
      .Call(
        "ArmaInnerSum",
        P, vec_x, vec_y
      )
    } else if (cpplib == 'eigen') {
      .Call(
        "EigInnerSum",
        P, vec_x, vec_y
      )
    } else if (cpplib == 'blaze') {
      .Call(
        "BlazeInnerSum",
        P, vec_x, vec_y
      )
    } else {
      stop("Just stop")
    }
    
  )
}
#### If looping in R ####
# Func_Inner_Sum_Matx <- function(P, vec_x, vec_y) {
#   P_upper <- ifelse(P %% 2 == 0, P / 2, (P + 1) * 0.5)
#
#   sum_count <- rep(0, nrow(vec_x))
#
#   for (r in 1:P_upper) {
#     sum_count <- sum_count + Func_Inner_Matx(
#       P, r, vec_x, vec_y
#     )
#   }
#   return(sum_count)
# }
