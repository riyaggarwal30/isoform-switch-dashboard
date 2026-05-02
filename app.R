library(shiny)
library(ggplot2)
library(dplyr)

# load data
df <- read.csv("mock_isoform_switch_data.csv")

# UI
ui <- fluidPage(
  
  titlePanel("Isoform Switch Explorer"),
  
  sidebarLayout(
    
    sidebarPanel(
      h4("Controls"),
      selectInput("gene", "Select Gene:", choices = unique(df$gene))
    ),
    
    mainPanel(
      h4("Explore how isoform usage changes across conditions and its functional impact"),
      tabsetPanel(
        
        tabPanel("Switch Plot",
                 plotOutput("switchPlot", height = "400px")),
        
        tabPanel("Composition",
                 plotOutput("barPlot", height = "400px")),
        
        tabPanel("Summary",
                 verbatimTextOutput("summaryText")),
        tabPanel("Functional Impact",
                 tableOutput("annotationTable"))
      )
      
    )
    
  )
)

# switch plot
plot_switch <- function(data, gene_name) {
  
  gene_data <- data %>% filter(gene == gene_name)
  
  ggplot(gene_data, aes(x = condition, y = IF, group = isoform, color = isoform)) +
    geom_line(linewidth = 1.5, alpha = 0.8) +
    geom_point(size = 4) +
    labs(
      title = paste("Isoform Switching in", gene_name),
      subtitle = "Change in isoform usage between conditions",
      x = "",
      y = "Isoform Fraction"
    ) +
    theme_minimal(base_size = 14) +
    theme(
      plot.title = element_text(face = "bold", size = 16),
      plot.subtitle = element_text(size = 12, color = "gray40"),
      legend.title = element_blank(),
      legend.position = "right"
    )
}

# bar plot
plot_bar <- function(data, gene_name) {
  
  gene_data <- data %>% filter(gene == gene_name)
  
  ggplot(gene_data, aes(x = condition, y = IF, fill = isoform)) +
    geom_bar(stat = "identity") +
    labs(
      title = paste("Isoform Usage Composition:", gene_name),
      x = "",
      y = "Isoform Fraction"
    ) +
    theme_minimal(base_size = 14) +
    theme(
      plot.title = element_text(face = "bold"),
      legend.title = element_blank()
    )
}


#adding functional annotation
annotation <- data.frame(
  isoform = c("TP53_1","TP53_2","TP53_3",
              "BRCA1_1","BRCA1_2",
              "EGFR_1","EGFR_2","EGFR_3"),
  
  domain = c("DNA_binding","None","Regulatory",
             "BRCT","None",
             "Kinase","Kinase","None"),
  
  cds_length = c(1200, 800, 600,
                 1500, 700,
                 1300, 1100, 500)
)

df_annot <- merge(df, annotation, by = "isoform")

# server
server <- function(input, output) {
  
  output$switchPlot <- renderPlot({
    plot_switch(df, input$gene)
  })
  
  output$barPlot <- renderPlot({
    plot_bar(df, input$gene)
  })
    
    output$annotationTable <- renderTable({
      df_annot %>%
        filter(gene == input$gene) %>%
        select(isoform, domain, cds_length) %>%
        distinct()
    })
  
  output$summaryText <- renderText({
    paste(
      "Gene", input$gene,
      "shows a change in isoform usage between control and disease conditions.",
      "This may indicate functional differences at the protein level."
    )
  })
}
shinyApp(ui, server)