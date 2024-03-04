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

#create a vector for each of the text/images
#stack each image side by side
v1 <- c(good_hair_txt, good_hair)
frame_1 <- image_append(v1)
v2 <- c(needs_cut_txt, needs_cut)
frame_2 <- image_append(v2)
v3 <- c(in_barber_txt, in_barber)
frame_3 <- image_append(v3)
v4 <- c(mid_cut_txt, mid_cut)
frame_4 <- image_append(v4)
v5 <- c(after_cut_txt, after_cut)
frame_5 <- image_append(v5)

#add all frames to a vector
frames <- c(frame_1, frame_2, frame_3, frame_4, frame_5)

#animate the meme
meme_gif <- image_animate(frames, fps = 1)

#write the gif
image_write(meme_gif, "meme_gif.gif")
