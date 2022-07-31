#' UI for the advancedShiny app
#' 
#' @import sass
#' @import shiny
#' @import imola
app_ui <- function() {
  
  # Convert sass to CSS for use in app
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
        basis = c("45%", "45%"),
        gap = "10%",
        
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
          Welcome! My name is Chris and I'm a senior Data Scientist working in the UK. This
          website is a shiny app I have developed to host information about me and the projects I am working on.
          Please dont hesitate to get in touch via one of the social media links at the top or by", 
          tags$a("emailing me directly.", href = "mailto:chris.brownlie@hotmail.co.uk")
          ),
          p(class = "about-me",
          "
          If you spot any issues or errors on this app, I would very much appreciate if you could", tags$a("raise a
          Github issue here", href = "https://github.com/chrisbrownlie/personal_site/issues/new"), "to let me know!
          "),
          p(class = "about-me",
          "
          This app is itself hosted on my personal shiny server where I keep all of my apps - see the Projects
          section for links to some of them.
          ")
          ),
        
        tags$div(
          class = "expertise",
          h3("Expertise", class = "panel-title-main"),
          tags$ul(
              tags$li(class = "checkmark",
                      "R:",
                      tags$ul(
                        tags$li("Package development"),
                        tags$li("Querying and creating APIs"),
                        tags$li("Process automation & optimisation")
                      )),
              tags$li(class = "checkmark",
                      "R shiny:",
                      tags$ul(
                        tags$li("Data management & collection apps"),
                        tags$li("MI and reporting dashboards"),
                        tags$li("Conversion of Excel spreadsheets to apps")
                        )
              ),
              tags$li(class = "checkmark",
                      "R Server management:", 
                      tags$ul(
                        tags$li("RStudio Connect"),
                        tags$li("Shiny Server"), 
                        tags$li("ShinyProxy")
                      )
              )
            )
          ),
        
        tags$div(
          class = "other-experience",
          h3("Other experience", class = "panel-title-main"),
          tags$ul(
              tags$li(class = "checkmark",
                      "Python:", 
                      tags$ul(
                        tags$li("Data manipulation with pandas"),
                        tags$li("ML & DL with sklearn and pytorch"),
                        tags$li("Website development with django")
                      )),
              tags$li(class = "checkmark",
                      "SQL Server: creating & managing databases, warehousing basics"),
              tags$li(class = "checkmark",
                      "Git & Github"),
              tags$li(class = "checkmark",
                      "Azure devops release/pipeline management"),
              tags$li(class = "checkmark",
                      "HTML/CSS, basics of Javascript & Julia")
            )
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
                 info = tags$span(h6("Working in the Education & Skills Funding Agency, specialising in R and R Shiny, developing complex code-based funding models and forecasting methods. Developed expertise in RStudio Connect."),
                                  h6(tags$b("Financial reporting:"),
                                     tags$ul(
                                       tags$li("Identified an overly complex Excel spreadsheet being used to track expenditure within the Data Science division."),
                                       tags$li("Developed an R shiny app and SQL Server database backend to replace."),
                                       tags$li("Saved 2-3 days of work per month spent updating and allowed more advanced reporting/analytics.")
                                     )),
                                  h6(tags$b("Academies budget:"),
                                     tags$ul(
                                       tags$li("Forecasting expenditure on all academies in the country."),
                                       tags$li("Developed an R package which contained all documentation and various models."),
                                       tags$li("Saved a week or more of work each month and accurately forecasts ~£25bn of funding.")
                                     )),
                                  h6(tags$b("Counter Fraud:"),
                                     tags$ul(
                                       tags$li("Development of machine learning processes to identify fraud in the Apprenticeships sector."),
                                       tags$li("Used both R (tidymodels) and Python (sklearn) to explore best methods for detection."),
                                       tags$li("Production dashboard in use by investigations colleagues to identify potentially fraudulent activity.")
                                     ))),
                 date = "Department for Education (2021 - present)"),
            list(title = "Data Scientist",
                 info = tags$span(h6("Working in the Education & Skills Funding Agency, as part of the Analysis & Modelling team. Developed expertise in R Shiny, text analysis and financial forecasting."),
                                  h6(tags$b("Admin reporting:"),
                                     tags$ul(
                                       tags$li("Multiple Excel spreadsheets sent out across the agency to finance colleagues to fill in their forecasts for the year."),
                                       tags$li("Developed an R shiny app and SQL Server database backend to replace and reduce room for errors."),
                                       tags$li("Final app in use by ~30+ people for several days each month, reduced errors and improved the process.")
                                     )),
                                  h6(tags$b("dfeCRAN:"),
                                     tags$ul(
                                       tags$li("Developed internal R package repository to allow colleagues to share sensitive R packages."),
                                       tags$li("Used by several R package developers in the department to share their work"),
                                       tags$li("Additional shiny app to allow submission of packages and automated rmarkdown to notify via email when submissions were made.")
                                     ))
                                  ),
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
            list(title = "MSc Data Science (Distinction)",
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

      
      # Writing section
      imola::flexPanel(
        class = "page-container fifth-panel",
        basis = "80%",
        grow = 0,
        wrap = "wrap",
        justify_content = "center",
        
        h3("Writing", class = "panel-title-second"),
        h6(class = "panel-paragraph-second", "Below you can see some of my recent blog posts, published in my online publication", tags$i("Data Slice."),
          "With all my articles, I try to keep them as original as possible and only post when I think I can discuss something
          genuinely interesting and unique."),
        h6(class = "panel-paragraph-second", tags$b("Please Note:"), "the carousel below may not display correctly on mobile devices."),
        embed_medium_feed(publication = "data-slice",
                          tag = "")
      ),
      
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