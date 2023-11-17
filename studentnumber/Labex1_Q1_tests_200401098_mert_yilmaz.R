install.packages("testthat")
install.packages("pak")
pak::pak("r-lib/testthat")
pkgbuild::check_build_tools(debug = TRUE)

rm(list = ls())
if (file.exists("MapsThatChangedOurWorld_StoryMap_Data.csv")) {
  file.remove("MapsThatChangedOurWorld_StoryMap_Data.csv")
}

library(testthat)
testthat::test_file("Vize_Q1_200401098_mert_yilmaz.R")
# Source the script you want to test (replace "Vize_Q1_200401098_mert_yilmaz.R" with your actual script file)
source("Vize_Q1_200401098_mert_yilmaz.R")

test_that("Vize_Q1_200401098_mert_yilmaz.R adlı dosya aktif dizinde mevcuttur", {
  expect_true(file.exists("Vize_Q1_200401098_mert_yilmaz.R"))
})

rm(list = ls())
if (file.exists("MapsThatChangedOurWorld_StoryMap_Data.csv")) {
  file.remove("MapsThatChangedOurWorld_StoryMap_Data.csv")
}

library(testthat)
testthat::test_file("Vize_Q1_200401098_mert_yilmaz.R")
# Source the script you want to test (replace "Vize_Q1_200401098_mert_yilmaz.R" with your actual script file)
source("Vize_Q1_200401098_mert_yilmaz.R")

# 2.4 Test
test_that("MapsThatChangedOurWorld_StoryMap_Data.csv adlı dosya aktif dizinde mevcuttur.", {
  expect_true(file.exists("MapsThatChangedOurWorld_StoryMap_Data.csv"))
})

# 2.5 Test
test_that("maps adlı değiken Global Workspace’de mevcuttur.", {
  expect_true(exists("maps"))
})

# 2.6 Test
test_that("maps nesnesi bir data.frame’dir.", {
  expect_true(is.data.frame(maps))
})

# 2.7 Test
test_that("maps adlı data.frame’in ilk sütunun adı 'City' olmalıdır.", {
  expect_equal(colnames(maps)[1], "City")
})

# 2.8 Test
test_that("maps adlı data.frame’in 5. sütunun adında 'Title' kelimesi geçmelidir.", {
  expect_true("Title" %in% colnames(maps)[5])
})

# 2.9 Test
test_that("Latitude adlı sütun numeric değerlerden oluşmalıdır.", {
  expect_true(all(sapply(maps$Latitude, is.numeric)))
})

# 2.10 Test
test_that("Longitude adlı sütun numeric değerlerden oluşmalıdır.", {
  expect_true(all(sapply(maps$Longitude, is.numeric)))
})

# 2.11 Test
test_that("idx nesnesi Global Workspace’de mevcuttur.", {
  expect_true(exists("idx"))
})

# 2.12 Test
test_that("idx nesnesinin tipi (class’ı) integer’dir.", {
  expect_equal(class(idx), "integer")
})

# 2.13 Test
test_that("Year adlı sütun numeric değerlerden oluşmalıdır.", {
  expect_true(all(sapply(maps$Year, is.numeric)))
})

# 2.14 Test (BONUS)
test_that("Longitude adlı sütunun 3., 9. ve 10. elementleri negatif numeric değerler içermelidir.", {
  expect_true(all(maps$Longitude[c(3, 9, 10)] < 0))
})

# 2.15 Test (BONUS)
test_that("finalResult adlı değiken vardır, bir data.frame’dir, 3 sütundan oluşmalıdır ve sütün isimleri sırasıyla Longitude, Latitude ve Year olmalıdır.", {
  expect_true(exists("finalResult"))
  expect_true(is.data.frame(finalResult))
  expect_equal(colnames(finalResult), c("Longitude", "Latitude", "Year"))
})