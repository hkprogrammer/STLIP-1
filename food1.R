recipe <-matrix(nrow=5,ncol=7)

recipe[1,]<-c(0,1,1,'Mapo Tofu','Chinese Cantonese Style','0','20')
names(recipe)<-c('recipe_id','course_id','food_category','recipe_name','cuisine','prep_time','cook_time')
recipe<-data.frame(recipe)


sapply(names(recipe),function(x) recipe$x <-as.integer(recipe$x))


recipe$food_category <- as.integer(recipe$food_category)

View(recipe)

food_category <- data.frame(matrix(ncol=2))
food_category[1,] <- c('1','Chinese')
names(food_category) <- c('food_category_id','food_category_name')
food_category$food_category_id <- as.integer(food_category$food_category_id)

course <- data.frame(matrix(ncol=2))
course[1,] <- c(1,'Entree')
names(course) <- c('course_id','course_name')
course$course_id <- as.integer(course$course_id)

names(ingredients) <- c('ingredient_id','ingredient_name') 

quantity <- data.frame(matrix(ncol=5))
names(quantity) <- c('quantity_id','recipe_id','ingredient_id','ingredient_measurement','ingredient_quantity')
quantity[1,] <- c('1','0','1','6','Tbsp')
quantity$ingredient_quantity <- as.integer(quantity$ingredient_quantity)

measurements <- data.frame(matrix(ncol=2))
names(measurements) <- c('measurement_id','measurement_name')
measurements[1,] <- c('1','Tbsp')
measurements$measurement_id <- as.integer(measurements$measurement_id)

recipe_steps <- data.frame(matrix(ncol=4))
names(recipe_steps) <- c('step_id','recipe_id','step_number','step_description')
recipe_steps[1,] <- c('1','0','1','Brown pork in wok')
recipe_steps$step_number<- as.integer(recipe_steps$step_number)



View(dbGetQuery(con,'select recipe.recipe_id, recipe.recipe_name,  recipe.cuisine, recipe.prep_time, recipe.cook_time, courses.course_name,food_category.food_category_name from Recipe  join courses on courses.course_id=recipe.course_id join food_category  on food_category.food_category_id = recipe.food_category_id  '))
View(dbGetQuery(con,'select recipe.recipe_id, recipe.recipe_name, ingredients.ingredient_name, quantity.ingredient_quantity, measurements.measurement_name from recipe  join quantity on quantity.recipe_id=recipe.recipe_id join ingredients on quantity.ingredient_id=ingredients.ingredient_id join measurements on measurements.measurement_id=quantity.measurement_id'))


dbWriteTable(con, 'courses',course,overwrite=TRUE)
dbWriteTable(con, 'recipe', recipe,overwrite=TRUE)
dbWriteTable(con, 'recipe_steps',recipe_steps,overwrite=TRUE)
dbWriteTable(con, 'ingredients', ingredients,overwrite=TRUE)
dbWriteTable(con, 'quantity',quantity,overwrite=TRUE)
dbWriteTable(con,'measurements',measurements,overwrite=TRUE)
dbWriteTable(con, 'food_category', food_category, overwrite=TRUE)

course<- dbReadTable(con,'courses')
recipe<- dbReadTable(con,'recipe')
recipe_steps<- dbReadTable(con,'recipe_steps')
ingredients<- dbReadTable(con,'ingredients')
quantity<- dbReadTable(con,'quantity')
measurements<- dbReadTable(con,'measurements')
food_category<- dbReadTable(con,'food_category')





