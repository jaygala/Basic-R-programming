#SUBSET

mtcars

newdata = subset(mtcars, mpg>=20 &mpg<=30, select=c(mpg,disp))
newdata

names(mtcars)
newdata2= subset(mtcars, cyl == 6 &disp>150, select= mpg:wt)
newdata2

airquality
