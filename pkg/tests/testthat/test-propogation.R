context("Propogation")

test_that("Env value pushed to R",
      {
          Sys.setenv(v1 = 4,
                     v2 = "4",
                     v3 = "d"
                     )
          setvars(list(v1 = -4,
                       v2 = -4,
                       v3 = -4
                       ),
                  .mode = "fallback"
                  )
          expect_identical(v1, "4")
          expect_identical(v2, "4")
          expect_identical(v3, "d")
      }
          )
