
create_wiki_graph <- function() {
  data.frame(
    v1 = c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
    v2 = c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
    w  = c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9)
  )
}

test_that("outputs are correct in the Dijkstra algorithm", {
  wiki_graph <- create_wiki_graph()
  expect_equal(dijkstra(wiki_graph,1), c(0,7,9,20,20,11))
  expect_equal(dijkstra(wiki_graph,2), c(7,0,10,15,21,12))
})

test_that("Dijkstra throws error for invalid input", {
  wiki_graph <- create_wiki_graph()

  expect_error(dijkstra(wiki_graph, 9)) #node not present in the graph

  graph <- wiki_graph
  names(graph) <- c("v3", "v4", "w") #column names not matching
  expect_error(dijkstra(graph, 3))

  graph <- wiki_graph[1:2] #three columns not present
  expect_error(dijkstra(graph, 3))

  wiki_graph$w[wiki_graph$v1 == 1 & wiki_graph$v2 == 2] <- -7 #weight should not be zero
  expect_error(dijkstra(wiki_graph, 1)) #
})
