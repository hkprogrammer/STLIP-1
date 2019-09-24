#Connect to MyRecipe Database
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname= 'MyFoodRecipe',host = "localhost", port = 5432,
                                 user = "postgres", password = 'FoodData')
drv <- dbDriver("MySQL")
con<- dbConnect(drv, dbname='mysql', host= "127.0.0.1", port=5431, user='brandonlum',password = 'FoodData1')
