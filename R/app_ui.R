#' UI for the advancedShiny app
#' 
#' @import sass
#' @import shiny
#' @import imola
app_ui <- function() {
  
  # Convert the Sass styling sheet to CSS so it can be called in dashboardBody below
  sass::sass(
    sass::sass_file(system.file("app/www/styling.scss", package = "chrisbrownlie")),
    output = system.file("app/www/styling.css", package = "chrisbrownlie")
  )
  
  # Define site ui
  shiny::bootstrapPage(
    title = "Chris Brownlie",
    theme = bslib::bs_theme(version = 5),
    
    imola::flexPanel(
      class = "page-container",
      
      direction = "column",
      justify_content = "center",
      align_items = "center",
      gap = "15vh",
      
      # HTML Headers
      tags$head(
        # Include custom CSS
        tags$link(href = "styling.css", rel = "stylesheet", type = "text/css"),
        # Include favicon
        tags$link(rel = "shortcut icon", href = "advancedShiny.ico"),
        
        tags$link(href="https://fonts.googleapis.com/css2?family=Nunito:wght@300&display=swap", rel="stylesheet")
      ),
      
      # Header content section
      imola::flexPanel(
        class = "page-container first-panel",
        
        direction = "column",
        justify_content = "flex-start",
        align_items = "center",
        
        tags$img(src = "img/circular_profile.png", class = "profile-image"),
        tags$div(
          h1("Chris Brownlie", class = "title-name"),
          h3("Senior Data Scientist - UK", class = "subtitle-name"),
          socials_bar(
            links = list(
              list(link = "https://www.twitter.com/datascience_cb", icon = "twitter"),
              list(link = "https://www.linkedin.com/in/chris-brownlie-bb5812b7/", icon = "linkedin"),
              list(link = "https://www.github.com/chrisbrownlie", icon = "github"),
              list(link = "https://medium.com/@chris.brownlie", icon = "medium")
            )
          )
        )
      ),
      
      # About me section
      imola::flexPanel(
        class = "page-container second-panel",
        
        direction = "row",
        justify_content = "center",
        align_items = "flex-start",
        wrap = "wrap",
        basis = c("200px", "200px"),
        gap = "20px",
        
        tags$div(
          h3("Details", class = "panel-title-main"),
          p(class = "details", tags$b("Name:"), "Chris Brownlie"),
          
          p(class = "details", tags$b("Email:"), "chris.brownlie@hotmail.co.uk"),
          
          p(class = "details", tags$b("Location:"), "Nottingham, UK")
        ),
        
        tags$div(
          h3("Hello there!", class = "panel-title-main"),
          p(class = "about-me",
          "
          Welcome to my personal site! This is a web app I've created using R Shiny that contains
          everything you need to know about me, as well as links to some projects I'm working on.
          ",
          tags$br(),
          "
          This app is hosted on my personal shiny server where I keep all of my apps - see the Projects
          section for links to some of them.
          "),
          h3("About this app", class = "panel-title-main"),
          p(class = "about-me",
            "The code used to generate this shiny app is available", tags$a("here.", href = "https://github.com/chrisbrownlie/personalSite"),
            "The responsive UI was developed with the help of the", tags$a("imola", href = "https://github.com/pedrocoutinhosilva/imola"), "package, among others.")
        )
        
      ),
      
      # Projects section
      imola::flexPanel(
        class = "page-container third-panel",
        
        gap = "50px",
        basis = c("100%", rep("30%", 6)),
        grow = 0,
        wrap = "wrap",
        justify_content = "center",
        h3("Projects", class = "panel-title-second"),
        project_card(
          link = "https://chrisbrownlie.com/advancedShiny",
          img = "img/advanced_shiny.png",
          name = "advancedShiny",
          desc = "An app for learning intermediate and advanced R Shiny concepts."
        ),
        
        project_card(
          link = "https://twitter.com/mel_rugby",
          img = "img/mel_rugby.jpg",
          name = "Mel Rugby",
          desc = "Automated ML framework for predicting Rugby World Cup results."
        ),
        
        project_card(
          link = "https://github.com/chrisbrownlie/bioplausible-deep-learning",
          img = "img/bioplausible_dl.jpg",
          name = "Biologically Plausible Deep Learning",
          desc = "Improving biological plausibility of Deep Neural Networks.",
          img_alt = "Photo of a brain, by Milad Fakurian on Unsplash"
        ),
        
        project_card(
          link = "https://medium.com/data-slice",
          img = "img/dataslice.png",
          name = "Data Slice",
          desc = "Online publication for analytical and Data Science-based original
          articles"
        ),
        
        project_card(
          link = "https://chrisbrownlie.com/scriptSearch",
          img = "img/script_search.jpg",
          name = "scriptSearch",
          desc = "Shiny app to allow quick exploration and text analysis."
        ),
        
        project_card(
          link = "https://shiny.chrisbrownlie.com",
          img = "img/shiny_servers.jpg",
          name = "Shiny servers",
          desc = "Shiny server and shinyProxy server, both hosted in the cloud
          and attached to this domain. You are currently viewing the former, 
          click here to view the latter."
        )
        
      ), # end Projects section flexPanel
      
      # Experience section
      imola::flexPanel(
        class = "page-container fourth-panel",
        
        direction = "column",
        
        timeline(
          title = "Experience",
          stuff = list(
            list(title = "Senior Data Scientist",
                 info = "Working in the Education & Skills Funding Agency. Specialising in R and R Shiny, developing complex code-based funding models and forecasting methods. Developed expertise in RStudio Connect.",
                 date = "Department for Education (2021 - present)"),
            list(title = "Data Scientist",
                 info = "Working in the Education & Skills Funding Agency, as part of the Analysis & Modelling team. Developed expertise in R Shiny, text analysis and financial forecasting.",
                 date = "Department for Education (2019 - 2021)"),
            list(title = "Writer & Editor",
                 info = "Writing blogs about data science projects, for various online publications such as Towards Data Science, Level Up Coding, Noteworthy and The Startup. Created my own publication to host my articles - Data Slice - which currently has over 600 followers.",
                 date = "Data Slice (2020 - present)"),
            list(title = "Junior Data Scientist",
                 info = "Working in the Academies team, providing financial forecasting for £18bn worth of funding. Developed expertise in R, PowerBI and PowerQuery.",
                 date = "Department for Education (2018 - 2019)"),
            list(title = "Junior Data Engineer",
                 info = "Working in the Data Engineering team, managing and manipulating a large Data Warehouse. Developed expertise in SQL, database management and data warehousing.",
                 date = "Department for Education (2017 - 2018)")
          )
        ),
        
        timeline(
          title = "Education",
          stuff = list(
            list(title = "MSc Data Science",
                 info = "Securing sponsorship from my employer, studying part time for two years alongside full-time work. Developed knowledge of Big Data techniques, data mining and statistical analysis. Dissertation focussing on Deep Learning, specifically biologically plausible neural networks without backpropagation of error. Graduated with Distinction.",
                 date = "University of Sheffield (2019-2021)"),
            list(title = "BSc Economics",
                 info = "Studied Economics with a focus on mathematical economics and econometrics. Studied set theory and advanced algebra as well as development, international trade and behavioural economics. Campus Ambassador for the Economics and Financial Society. Member of the Mens Rugby Union Team.",
                 date = "University of Nottingham (2014-2017)"),
            list(title = "A Levels",
                 info = "Studied Maths (A*), Further Maths (A) and Economics (A*). Deputy Head Boy and Clubs & Societies Prefect. Player of the Year, Rugby First XV.",
                 date = "")
          )
        )
        
      ), # end Experience section flexPanel

      # TODO: Add Medium/blog post section
      # TODO: Add skills/knowledge section
      # Both of the above may come before experience? or the blog post section at least should probably/maybe go after projects
      
      # TODO: add footer/contact details
      
      imola::flexPanel(
        class = "page-container footer-panel",
        basis = c("150px", "500px"),
        p("Chris Brownlie, 2022"),
        p("Images either created independently or from", tags$a("Unsplash", href = "https://unsplash.com"), "or", tags$a("Pixabay", href = "https://pixabay.com"))
      )
            
    ) # end main flexPanel
    
  ) # end bootstrapPage
  
}