context("Post Processing")

test_that("Int coercion after fallback",
      {
          Sys.setenv(v1 = 4,
                     v2 = "4"
                     )
          setvars(list(v1 = -4,
                       v2 = -4
                       ),
                  .mode = "fallback",
                  .post = {
                      v1 <- as.integer(v1)
                      v2 <- as.integer(v2)
                  }
                  )

          expect_identical(v1, 4L)
          expect_identical(v2, 4L)
      }
          )

test_that("Numeric coercion after fallback",
      {
          Sys.setenv(v1 = 4,
                     v2 = "4"
                     )
          setvars(list(v1 = -4,
                       v2 = -4
                       ),
                  .mode = "fallback",
                  .post = {
                      v1 <- as.numeric(v1)
                      v2 <- as.numeric(v2)
                  }
                  )

          expect_identical(v1, 4.0)
          expect_identical(v2, 4.0)
      }
          )


test_that("Int coercion after override",
      {
          Sys.setenv(v1 = 4,
                     v2 = "4"
                     )
          setvars(list(v1 = -4,
                       v2 = -4
                       ),
                  .mode = "override",
                  .post = {
                      v1 <- as.integer(v1)
                      v2 <- as.integer(v2)
                  }
                  )

          expect_identical(v1, -4L)
          expect_identical(v2, -4L)
      }
          )

test_that("Numeric coercion after override",
      {
          Sys.setenv(v1 = 4,
                     v2 = "4"
                     )
          setvars(list(v1 = -4,
                       v2 = -4
                       ),
                  .mode = "override",
                  .post = {
                      v1 <- as.numeric(v1)
                      v2 <- as.numeric(v2)
                  }
                  )

          expect_identical(v1, -4.0)
          expect_identical(v2, -4.0)
      }
          )
