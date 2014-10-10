context("Numeric Coercion")

test_that("Numeric coercion after fallback",
      {
          Sys.setenv(v1 = 4,
                     v2 = "4"
                     )
          setvars(list(v1 = -4,
                       v2 = -4
                       ),
                  .mode = "fallback",
                  .numeric = c("v1", "v2")
                  )

          expect_identical(v1, 4.0)
          expect_identical(v2, 4.0)
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
                  .numeric = c("v1", "v2")
                  )

          expect_identical(v1, -4.0)
          expect_identical(v2, -4.0)
      }
          )
