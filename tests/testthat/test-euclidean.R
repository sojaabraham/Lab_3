
test_that("GDC is calculated correctly.", {
  expect_equal(euclidean(123612, 13892347912), 4)
  expect_equal(euclidean(100, 1000), 100)
  expect_equal(euclidean(-100, 1000), 100)
  expect_equal(euclidean(120, 25), 5)
})


test_that("Wrong input throws an error.", {
  expect_error(euclidean("a", 1000))
  expect_error(euclidean(100, "1000"))
  expect_error(euclidean(TRUE, "1000"))
  expect_error(euclidean(21.1, 12))
})
