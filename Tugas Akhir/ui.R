library(ggplot2)
library(shiny)
library(DT)
library(shinyAce)

ui <- fluidPage(
  
  h2("Aplikasi Korelasi", style="
     font-family: 'Lobster', cursive;
     color : blue;
     text-align: center
     "),
  
  h4("Perhitungan Korelasi Pearson & Spearman", style="
     font-family: 'cursive';
     color : red;
     text-align: center
     "),
  
  HTML('<center><img src="gambar1.png" width="300"></center>'),
  
  navbarPage("",
             
             tabPanel("Home",
                      h5("Ini adalah aplikasi yang digunakan untuk menghitung korelasi Pearson & Spearman.",
                      style="color: blue; text-align:left"),
                      br()
             
                      ),
             
             tabPanel("Import Data",
                      
                      sidebarPanel(
                        
                        fileInput("ambil_file_data", "Choose .txt/.csv File",
                                  accept = c(
                                    "text/csv",
                                    "text/comma-separated-values,text/plain",
                                    ".csv")
                                  ),
                        radioButtons("pemisah_variabel", "Separator",
                                     choices = c(Comma = ",",
                                                 Semicolom = ":",
                                                 Tab = "\t"),
                                     selected = ",", inline = TRUE),
                        
                      ),
                      
                      mainPanel(
                        DT::DTOutput("tampilkan_data"),
                        
                      ),
                      
                      br()
             
                      ),
             
             tabPanel("Select Variable",
                      
                      sidebarPanel(
                        shinyAce::aceEditor("pilih_variabel", value = "1\n2\n", mode = "r",
                                            theme = "cobalt", height = 380),
                        br()
                      ),
                      
                      mainPanel(
                        verbatimTextOutput("pilihan_variabel_anda"),
                        br()
                      ),
                      
                      br()
                      
             ),
             
             tabPanel("Result",
                      
                      h2("Korelasi Pearson", style="
                         font-family: 'Lobster', cursive;
                         color: blue;
                         text-align:center
                         "),
                      h4("Desimal: ", style = "color: blue;
                         text-shadow: -1px 0 black,
                         0 1px black, 1px 0 black, 0 -1px black;
                         text-align:left",
                         align = "left"),
                      sliderInput("setting_desimal", "", 1,10,3, step = 1),
                      
                      DT::DTOutput("hasil_korelasi_pearson"),
                      
                      br(),
                      br(),
                      
                      h2("Korelasi Spearman", style = "
                         font-family: 'Lobster', cursive;
                         color: blue;
                         text-align: center
                         "),
                      
                      DT::DTOutput("hasil_korelasi_spearman"),
                      
                      br()
                      )
            ),

  br()
  
)


denia <- print('hello world')








