#web scrapping using r and SELECTOR GADGET
#importing library
library(rvest)
library(dplyr)
#scrapping webstite
link="https://www.goodhousekeeping.com/uk/product-reviews/tech/g41188977/tech-gifts/"
#html element from website
web=read_html(link)
#segregating name
name=web%>%html_nodes(".listicle-slide-hed-text")%>%html_text()
#view the name of the movie
View(name)
#segregating years
slno=web%>%html_nodes(".listicle-slide-product+ .listicle-slide-product .listicle-slide-hed-number , .listicle-slide-product:nth-child(3) .listicle-slide-hed-text")%>%html_text()
#view year
View(slno)
#segregating ratings
website=web%>%html_nodes(".listicle-slide-hed .noskim")%>%html_text()
#view ratings
View(website)
#creating data frame
gadgets=data.frame(name,slno,website)
#view data frame
View(gadgets)
write.csv(gadgets,'top50gadgets.csv')
