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

write.xlsx(penguins, "/Users/joaquinromero/desktop/R4DS/data/penguins.xlsx")
penguins



































































































