#' Wikipedia Graph Dataset
#'
#' A dataset representing a small weighted graph from Wikipedia.
#'
#' @format A data frame with 3 columns:
#' \describe{
#'   \item{v1}{Source node of the edge (numeric).}
#'   \item{v2}{Target node of the edge (numeric).}
#'   \item{w}{Weight of the edge (numeric).}
#' }
#' @source
#'    \url{https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)}
#'
#' @examples
#' head(wiki_graph)
#' dijkstra(wiki_graph, 1)
#' @export
wiki_graph <- data.frame(
  v1 = c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
  v2 = c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
  w  = c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9)
)
