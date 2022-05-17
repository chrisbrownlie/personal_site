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


#' Timeline
#' 
#' Create a timeline for work experience info
#' 
#' @param title the title of the timeline
#' @param stuff list, each element has date, title and info
#' 
#' @return HTML code to provide a timeline of activities
timeline <- function(title, stuff) {
  tags$div(
    class="timeline-content timeline-container",
    id="timeline-content",
    tags$div(
      class = "padding",
      tags$div(
        class = "row",
        tags$div(
          class = "col-lg-12",
          h3(title),
          tags$div(
            class = "timeline p-4 block mb-4",
            purrr::imap(stuff,
                        function(element,index){
                          tags$div(
                            class = "tl-item active",
                            tags$div(class = "tl-dot b-primary"),
                            tags$div(
                              class = "tl-content",
                              h4(element[["title"]]),
                              tags$div(class = "tl-date text-muted mt-1", element[["date"]]),
                              p(style = "text-align:left", element[["info"]])
                            )
                          )
                        })
          )
        )
      )
    )
  )
}