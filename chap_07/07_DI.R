# Data Import

library(tidyverse)



### Reading Data from a File

students <- read_csv("/Users/joaquinromero/desktop/R4DS/data/students.csv")

students <- read_csv("https://pos.it.r4ds-students-csv")

### Practical Advice

students

students <- read_csv("/Users/joaquinromero/desktop/R4DS/data/students.csv", na = c("N/A", ""))

students

students %>% 
  rename(
    student_id = `Student ID`,
    full_name = `Full Name`
  )

students %>% janitor::clean_names()

students %>% 
  janitor::clean_names() %>% 
  mutate(meal_plan = factor(meal_plan))

students <- students %>% 
  janitor::clean_names() %>% 
  mutate(
    meal_plan = factor(meal_plan),
    age = parse_number(if_else(age == "five", "5", age))
  )

students

### Other Arguments

read_csv(
  "a,b,b
  1,2,3
  4,5,6"
)

read_csv(
  "The first line of metadata
  The second line of metadata
  x,y,z
  1,2,3",
  skip = 2
)

read_csv(
  "# A comment I want to skip
  x,y,z
  1,2,3",
  comment = "#"
)

read_csv(
  "1,2,3
  4,5,6",
  col_names = FALSE
)

read_csv(
  "1,2,3
  4,5,6",
  col_names = c("x", "y", "z")
)

### 

