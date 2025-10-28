# Spreadsheets

#### Pre-requisites

library(readxl)
library(tidyverse)
library(writexl)

### Getting Started

#### Reading Excel Spreadsheets

students <- read_excel("/Users/joaquinromero/desktop/R4DS/data/students.xlsx")

students

read_excel(
  "/Users/joaquinromero/desktop/R4DS/data/students.xlsx",
  col_names = c(
    "student_id", "full_name", "favourite_food", "meal_plan", "age")
)

read_excel(
  "/Users/joaquinromero/desktop/R4DS/data/students.xlsx",
  col_names = c(
    "student_id", "full_name", "favourite_food", "meal_plan", "age"),
  skip = 1
)

read_excel(
  "/Users/joaquinromero/desktop/R4DS/data/students.xlsx",
  col_names = c(
    "student_id", "full_name", "favourite_food", "meal_plan", "age"),
  skip = 1,
  na = c("", "N/A")
)

read_excel(
  "/Users/joaquinromero/desktop/R4DS/data/students.xlsx",
  col_names = c(
    "student_id", "full_name", "favourite_food", "meal_plan", "age"),
  skip = 1,
  na = c("", "N/A"),
  col_types = c("numeric", "text", "text", "text", "numeric")
)

read_excel(
  "/Users/joaquinromero/desktop/R4DS/data/students.xlsx",
  col_names = c("student_id", "full_name", "favourite_food", "meal_plan", "age"),
  skip = 1,
  na = c("", "N/A"),
  col_types = c("numeric", "text", "text", "text", "text")
)

students <- students %>%
  mutate(age = as.character(age)) %>%                   
  mutate(age = if_else(age == "five, 5", "5", age)) %>% 
  mutate(age = parse_number(age))     

students

### Reading Worksheets

penguins

write.xlsx(penguins, "/Users/joaquinromero/desktop/R4DS/data/penguins.xlsx", sheet = "Torgesen Island")

penguins_torgersen <- read_excel(
  "data/penguins.xlsx", sheet = "Torgersen Island", na = "NA"
)

penguins_torgersen

excel_sheets("data/penguins.xlsx")

penguins_biscoe <- read_excel("data/penguins.xlsx", sheet = "Biscoe Island", na = "NA")
penguins_dream <- read_excel("data/penguins.xlsx", sheet = "Dream Island", na = "NA")


dim(penguins_torgersen)

dim(penguins_biscoe)

dim(penguins_dream)

penguins <- bind_rows(penguins_torgersen, penguins_biscoe, penguins_dream)

#### Reading Part of a Sheet

deaths_path <- readxl_example("death.xlsx")
deaths <- read_excel(deaths_path)

deaths

readl_excel(deaths_path, range = "A5:F15")

#### Data Types

























































































