install.packages('cranlogs')

require(ggrepel)

dn = cranlogs::cran_downloads(c('caret','lme4','keras','cluster','MASS','knitr','kableExtra',
                                'shiny','rmarkdown','ggplot2','dplyr','Rcpp'),from = '2010-01-01')


d = dn %>% filter(count>0, date < "2020-06-02") %>%  group_by(month = round_date(date,'halfyear'), package) %>% 
  summarize(date = last(date),count = mean(count))
p = ggplot(d, aes(x = date, y = count, group = package, col = package)) + 
  geom_line(size=.8) + 
  geom_label_repel(data = d %>% 
                     group_by(package) %>% 
                     slice(n()) %>% ungroup(), 
                   aes(label = package, y = count),
                   nudge_x = 500,segment.color='grey75',
                   label.padding = 0.25,box.padding = 0.5,
                   na.rm = TRUE) + guides(col=F)  + theme_minimal() + 
  scale_x_date(limits = as.Date(c("2012-01-01","2023-01-01"))) +
  labs(x = "Datum",y = "Durchschnittliche downloads pro Tag") + 
  theme(axis.title = element_text(size=14)) + scale_colour_viridis_d()

ggsave('~/Dropbox (2.0)/Work/Software/RBootcamps/RmR_2020Jun/_sessions/Welcome/image/downloads.png',
       device='png',plot = p, width = 6,height = 6, dpi = 300)

