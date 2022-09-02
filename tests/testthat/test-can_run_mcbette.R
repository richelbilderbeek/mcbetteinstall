test_that("from custom location", {
  if (!beautier::is_on_ci()) return()

  beast2_folder <- tempfile(pattern = "mcbette_")
  expect_false(mcbette::can_run_mcbette(beast2_folder = beast2_folder))

  state_beast2_ns <- list(beast2_installed = TRUE, ns_installed = TRUE)
  set_mcbette_state(
    mcbette_state = state_beast2_ns,
    beast2_folder = beast2_folder
  )

  expect_true(mcbette::can_run_mcbette(beast2_folder = beast2_folder))
})
