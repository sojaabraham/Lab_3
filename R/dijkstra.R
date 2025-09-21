#' Implementation of Dijkstra Algorithm
#'
#' This function computes the shortest paths from a starting vertex to all other vertices
#' in a weighted graph using Dijkstra's algorithm.
#'
#' @param graph A data frame with 3 columns:
#'   \describe{
#'     \item{\code{v1}}{Starting vertex of an edge (numeric).}
#'     \item{\code{v2}}{Ending vertex of an edge (numeric).}
#'     \item{\code{w}}{Weight of the edge (non-negative numeric).}
#'   }
#' @param init_node A numeric scalar representing the starting vertex.
#'
#' @return A numeric vector of shortest distances from the starting vertex to each vertex.
#'
#' @references Wikipedia contributors. *Dijkstra algorithm*. Wikipedia. \url{https://en.wikipedia.org/wiki/Dijkstra_algorithm}
#'
#' @examples
#' # Example dataset
#' wiki_graph <- data.frame(
#'   v1 = c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
#'   v2 = c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
#'   w  = c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9)
#' )
#'
#' dijkstra(wiki_graph, 1)
#' # Expected output: 0 7 9 20 20 11
#'
#' @export
dijkstra <- function(graph, init_node) {
  # Input validation

  # Check graph is a data frame
  if (!is.data.frame(graph)) {
    stop("graph must be a data frame")
  }

  # Check graph has exactly 3 columns
  if (ncol(graph) != 3) {
    stop("graph must have exactly 3 columns: v1, v2, and w")
  }

  # Check column names
  required_cols <- c("v1", "v2", "w")
  if (!all(required_cols %in% names(graph))) {
    stop("graph must have columns named 'v1', 'v2', and 'w'")
  }

  # Check v1 and v2 are numeric/integer
  if (!all(sapply(graph[, c("v1", "v2")], is.numeric))) {
    stop("v1 and v2 columns must be numeric")
  }

  # Check w is numeric and non-negative
  if (!is.numeric(graph$w) || any(graph$w < 0)) {
    stop("w column must be numeric and non-negative")
  }

  # Check init_node is a single numeric value and exists in v1 or v2
  if (!is.numeric(init_node) || length(init_node) != 1 || init_node %% 1 != 0) {
    stop("init_node must be a single integer")
  }
  if (!(init_node %in% unique(c(graph$v1, graph$v2)))) {
    stop("init_node must exist in the graph nodes")
  }

  nodes <- unique(c(graph$v1, graph$v2))

  distances <- rep(Inf, length(nodes))
  names(distances) <- nodes
  distances[as.character(init_node)] <- 0

  visited <- rep(FALSE, length(nodes))
  names(visited) <- nodes

  for (i in seq_along(nodes)) {
    current <- names(which.min(ifelse(visited, Inf, distances)))

    visited[current] <- TRUE

    edges <- graph[graph$v1 == as.numeric(current), ]

    for (j in seq_len(nrow(edges))) {
      neighbor <- as.character(edges$v2[j])
      weight   <- edges$w[j]

      new_dist <- distances[current] + weight
      if (new_dist < distances[neighbor]) {
        distances[neighbor] <- new_dist
      }
    }
  }

  return(unname(distances))
}
