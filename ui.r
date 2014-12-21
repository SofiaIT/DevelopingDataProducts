
library(shiny)
library(TH.data)
data(bodyfat)
bodyfat <- bodyfat[,c(2,1,3:6)]

shinyUI(pageWithSidebar(
  headerPanel('Body Fat Clustering'),  
  sidebarPanel(
    selectInput('ycol', 'Y Variable', names(bodyfat)),
    selectInput('xcol', 'X Variable', names(bodyfat),
                 selected=names(bodyfat)[[2]]),
    numericInput('clusters', 'Cluster count', 3,
                  min = 2, max = 7)
    
  ),
  
 
  mainPanel(
    
    h3("An Interactive Graph for the Body Fat Clustering."),
    h4("Project for the course in 'Developing Data Products' - Data Science Specialization, JHU."),
    h4("Student: Sofia Cividini"),
    br(),
    p("This application is able to produce an interactive graph that shows different types of clusters based on the selection of the following variables 
      on the y-axis and on the x-axis. It is also possible to change the number of clusters from a minimum of 2 to a maximum of 7."),
    p(span("DEXfat:", style = "color:purple"), "body fat measured by DXA (Dual Energy X-Ray Absorptiometry)"),
    p(span("age:", style = "color:purple"), "age in years"),
    p(span("waistcirc:", style = "color:purple"), "waist circumference"),
    p(span("hipcirc:", style = "color:purple"), "hip circumference"),
    p(span("elbowbreadth:", style = "color:purple"), "breadth of the elbow"),
    p(span("kneebreadth:", style = "color:purple"), "breadth of the knee"),
    p("These data come from the data set called bodyfat which is available in the R library called TH.data. This
      data set contains the data collected from 71 healthy female subjects on 10 variables, both body fat measurements and anthropometric 
      measurements."),
    br(),
    br(),  
        
    plotOutput('plot1'),
    br(),
    br()
    
        
    
  )
))
