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

## Controlling Column Types

### Guessing Types

read_csv("
         logical,numeric,date,string
         TRUE,1,2021-01-15,abc
         false,4.5,2021-02-15,def
         T,Inf,2021-02-16,ghi
         ")

### Missing Values, Column Types & Problems

simple_csv <- "
x
10
,
20
30"

read_csv(simple_csv)

df <- read_csv(
  simple_csv,
  col_types = list(x = col_double())
)

problems(df)

read_csv(simple_csv, na = ".")

another_csv <- "
x,y,z
1,2,3"

read_csv(
  another_csv,
  col_types = cols(.default = col_character())
)

read_csv(
  another_csv,
  col_types = cols_only(x = col_character())
)

## Reading Data from Multiple Files

sales_files <- c("/Users/joaquinromero/desktop/R4DS/data/01-sales.csv",
                 "/Users/joaquinromero/desktop/R4DS/data/02-sales.csv",
                 "/Users/joaquinromero/desktop/R4DS/data/03-sales.csv")

read_csv(sales_files, id = "file")

sales_files <- c(
  "https://pos.it/r4ds-01-sales",
  "https://pos.it/r4ds-02-sales",
  "https://pos.it/r4ds-03-sales"
)

read_csv(sales_files, id = "file")

sales_files <- list.files("data", pattern = "\\.csv$", full.names = TRUE)

sales_files

### Writing to a File

write_csv(students, "/Users/joaquinromero/desktop/R4DS/data/students.csv")

students

write_csv(students, "/Users/joaquinromero/desktop/R4DS/data/students-2.csv")

read_csv("/Users/joaquinromero/desktop/R4DS/data/students-2.csv")

write_rds(students, "/Users/joaquinromero/desktop/R4DS/data/students.rds")

read_rds("/Users/joaquinromero/desktop/R4DS/data/students.rds")

library(arrow)

write_parquet(students, "/Users/joaquinromero/desktop/R4DS/data/students.parquet")

read_parquet("/Users/joaquinromero/desktop/R4DS/data/students.parquet")

### Data Entry

tibble(
  x = c(1, 2, 5),
  y = c("h", "m", "g"),
  z = c(0.08, 0.83, 0.6)
)

tribble(
  ~x, ~y, ~z,
  1, "h", 0.08,
  2, "m", 0.83,
  5, "g", 0.60
)


