# Markdown Dokument

# Setup chunk einfügen 


knitr::opts_chunk$set(echo = TRUE)
library(tidyverse)
library(knitr)
library(kableExtra)
airbnb <- read_csv('../1_Data/airbnb.csv')
dt <- mtcars[1:5, 1:6]


# Tabelle Einfügen

table(airbnb_1819$Stadtteil) 

table(airbnb_1819$Stadtteil)%>% kable()
 
table(airbnb_1819$Stadtteil)%>% kable(col.names = c('Stadteil', 'Frequenz'))
 
table(airbnb_1819$Stadtteil)%>% kable(col.names = c('Stadteil', 'Frequenz'), align = "lc")

table(airbnb$Stadtteil) %>% 
  kbl() %>%
  kable_paper("hover", full_width = T)


# Grafik einfügen

```{r, fig.asp = .3}
airbnb_1819 %>%
  group_by(Stadtteil) %>%
  summarise(n = n()) %>%
ggplot(aes(reorder(Stadtteil, -n), n)) +
  geom_histogram(stat = "identity") +
  labs(x = "Stadtteile", 
       y = "Anzahl",
       title = "Anzahl AirBnB Listing pro Stadtteil") +
  scale_x_discrete(guide = guide_axis(n.dodge = 2))
```

# statistisches modell

model <- lm(Preis ~ Unterkunftsart, data = airbnb_1819)
tab_model(model, show.se = T, p.style = 'stars', 
          col.order = c("est", "se", "p"))

# word 
output: html_document
to
output: word_document

powerpoint_presentation

model <- lm(Petal.Length ~ Species, data=iris) 
tab_model(model, file = "~/Desktop/model3.doc")






# figure numbering



NEU:

---
title: "My title"
author: "Me"
output: 
  bookdown::html_document2:
  number_sections: TRUE
  fig_caption: TRUE
---

```{r setup}
knitr::opts_chunk$set(echo=FALSE)
```

```{r plot1,fig.cap="Here is my caption for this amazing graph."}
x <- 1:10
y <- rnorm(10)
plot(x,y)
```

```{r plot2, fig.cap="Here is my caption for another amazing graph."}
plot(y,x)
```

```{r table1, caption="tabelle"}
knitr::kable(mtcars[1:5, 1:5], caption = "Here is an amazing table")
```

