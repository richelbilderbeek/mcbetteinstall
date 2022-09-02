test_that("use BEAST2 installed at a different location", {

  if (!beautier::is_on_ci()) return()

  beast2_folder <- tempfile(pattern = "mcbette_")
  set_mcbette_state(
    mcbette_state = list(beast2_installed = TRUE, ns_installed = TRUE),
    beast2_folder = beast2_folder
  )

  beast2_bin_path <- beastier::get_default_beast2_bin_path(
    beast2_folder = beast2_folder
  )
  expect_true(file.exists(beast2_bin_path))
  beast2_options <- beastier::create_mcbette_beast2_options(
    beast2_bin_path = beast2_bin_path
  )

  expect_silent(beastier::check_beast2_options(beast2_options))

  fasta_filename <- system.file("extdata", "simple.fas", package = "mcbette")

  expect_silent(
    mcbette::est_marg_lik(
      fasta_filename = fasta_filename,
      inference_model = beautier::create_test_ns_inference_model(),
      beast2_options = beast2_options
    )
  )
})
