library(magick)

#add images from device and scale them 
good_hair <- image_read("C:/Users/porte/OneDrive - The University of Auckland/STATS 220/good_hair.jpg")%>%
  image_scale(200)

needs_cut <- image_read("C:/Users/porte/OneDrive - The University of Auckland/STATS 220/needs_cut.jpg")%>%
  image_scale(200)

in_barber <- image_read("C:/Users/porte/OneDrive - The University of Auckland/STATS 220/in_barber.jpg")%>%
  image_scale(200)

mid_cut <- image_read("C:/Users/porte/OneDrive - The University of Auckland/STATS 220/mid_cut.jpg")%>%
  image_scale(200)

after_cut <- image_read("C:/Users/porte/OneDrive - The University of Auckland/STATS 220/after_cut.jpg") %>%
  image_scale(200)

#add blank images the same size as other images
#add text describing the situation
good_hair_txt <- image_blank(200, 
                   200, 
                   color = "white")%>%
  image_annotate(text = "I like this haircut",
                 color="black",
                 size = 15,
                 font="impact",
                 gravity = "center")

needs_cut_txt<- image_blank(200, 
                  200, 
                  color = "white")%>%
  image_annotate(text = "maybe I should get a haircut",
                 color="black",
                 size = 15,
                 font="impact",
                 gravity = "center")

in_barber_txt<- image_blank(200, 
                  200, 
                  color = "white")%>%
  image_annotate(text = "'just a little off the top'",
                 color="black",
                 size = 15,
                 font="impact",
                 gravity = "center")

mid_cut_txt<- image_blank(200, 
                  200, 
                  color = "white")%>%
  image_annotate(text = "this is looking a little short...",
                 color="black",
                 size = 15,
                 font="impact",
                 gravity = "center")

after_cut_txt<- image_blank(200, 
                  200, 
                  color = "white")%>%
  image_annotate(text = "wtf",
                 color="black",
                 size = 60,
                 font="impact",
                 gravity = "center")

#create a vector for the photos
hair_vector <- c(good_hair,
                 needs_cut,
                 in_barber,
                 mid_cut,
                 after_cut)

#create a vector for the text images
txt_vector <- c(good_hair_txt,
                needs_cut_txt,
                in_barber_txt,
                mid_cut_txt,
                after_cut_txt)

#stack the images
stacked_images <- image_append(hair_vector, stack = TRUE)

#stack the text images
stacked_txt<- image_append(txt_vector, stack=TRUE)

#create a vector of the two stacks
combined_txt_images <- c(stacked_txt, stacked_images)

#place the two stacks side by side
meme <-image_append(combined_txt_images)

image_write(meme, "my_meme.png")
