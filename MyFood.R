res<- dbSendQuery(con, 'SELECT Name FROM "foodrecipes"')
dbFetch(res)
dbListTables(con)

dbReadTable(con,'FoodRecipes')
dbListFields(con,'foodrecipes')
dbWriteTable(con,"FoodRecipes",food,overwrite=TRUE)

food <- dbReadTable(con,'foodrecipes')


  