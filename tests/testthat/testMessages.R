library(TestPackage)

expect_error(fars_read("random_file"), "file 'random_file' does not exist")
expect_warning(make_filename("a"), "NAs introduced by coercion")
