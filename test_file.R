install.packages(c("car", "ggplot2"))
library(ggplot2)
ggplot(data = mtcars, 
       mapping = aes(x = disp, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm")
st_joe_land <- read.delim(file = "stJoeLand.csv", sep = ",")
