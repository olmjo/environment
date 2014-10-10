context("Integer Coercion")

test_that("Numeric coercion after fallback",
      {
          Sys.setenv(v1 = 4,
                     v2 = "4"
                     )
          setvars(list(v1 = -4,
                       v2 = -4
                       ),
                  .mode = "fallback",
                  .integer = c("v1", "v2")
                  )

          expect_identical(v1, 4L)
          expect_identical(v2, 4L)
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
                  .integer = c("v1", "v2")
                  )

          expect_identical(v1, -4L)
          expect_identical(v2, -4L)
      }
          )
