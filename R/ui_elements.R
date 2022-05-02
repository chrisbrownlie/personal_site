#' Function to return a socials bar
#' 
#' Enter links to your socials and return a bar
#' 
#' @param links a list of lists with two named elements: link (the address
#' to link the icon to) and icon (the name of an icon)
#' 
#' @return HTML for a socials bar on the main page of website
socials_bar <- function(links) {
  
  shiny::tags$ul(
    class = "socials-bar",
    
    purrr::map(
      links,
      function(link_element) {
        shiny::tags$li(
          shiny::tags$a(href = link_element[["link"]],
                        fontawesome::fa_i(name = link_element[["icon"]])),
        )
      }
    )
    
  )
  
}

#' Projects card
#' 
#' Enter relevant info and links to create a card for a project with details etc.
#' 
#' @param link the link to navigate to when clicking (e.g. project repo)
#' @param img the image to use
#' @param name name of the project
#' @param desc a short description of the project
#' 
#' @return HTML code to provide a clickable image card for a project
project_card <- function(link,
                         img,
                         name,
                         desc,
                         img_alt = "") {
  
  shiny::tags$div(
    class = "project-container",
    shiny::tags$a(
      href = link,
      shiny::tags$img(
        class = "project-image",
        src = img,
        alt_text = img_alt
      ),
      shiny::tags$div(
        class = "project-overlay",
          shiny::tags$div(
            class = "project-desc",
            shiny::tags$span(name, style = "color:black;"),
            tags$br(),
            desc
          )
        )
      )
    )
  
}