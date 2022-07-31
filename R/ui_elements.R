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


#' Embed medium blog post as bootstrap carousel
#' 
#' Embed medium publication blog post as a carousel of cards.
#' Carousel code inspired by bootstrap example with captions in
#' bootstrap documentation.
#' 
#' @param publication the name of the publication to embed
#' @param tag the tag to filter for
#' 
#' @return an embedded medium feed
embed_medium_feed <- function(publication = "data-slice",
                              tag = "") {
  
  # Query link
  if (tag != "") {
    api_url <- paste0("https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fmedium.com%2Ffeed%2F", publication, "%2Ftagged%2F", tag)
  } else {
    api_url <- paste0("https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fmedium.com%2Ffeed%2F", publication)
  }
  
  rss_feed <- httr2::request(api_url) |>
    httr2::req_perform() |>
    httr2::resp_body_json()
  
  div(id="carouselMediumPosts", 
      class="carousel slide", 
      `data-bs-ride` = "carousel",
      div(class="carousel-indicators",
          tagList(
            lapply(seq_along(rss_feed$items),
                   function(i) {
                     if (i == 1) {
                       tags$button(type="button",
                                   `data-bs-target` = "#carouselMediumPosts",
                                   `data-bs-slide-to` = as.character(i-1),
                                   class = "active",
                                   `aria-current` = "true",
                                   `aria-label` = paste0("Slide ", i))
                     } else {
                       tags$button(type="button",
                                   `data-bs-target` = "#carouselMediumPosts",
                                   `data-bs-slide-to` = as.character(i-1),
                                   `aria-label` = paste0("Slide ", i))
                     }
                 })
        )
    ),
    div(class="carousel-inner",
        tagList(
          lapply(
            seq_along(rss_feed$items),
            function(i){
              i_class <- ifelse(i == 1, 
                                "carousel-item active", 
                                "carousel-item")
              description <- gsub(pattern = "<.*?>",
                                  replacement = "",
                                  rss_feed$items[[i]]$description) |>
                gsub(pattern = "Continue reading on Data Slice.*$",
                     replacement = "") |>
                paste0(".")
              new_title <- gsub(pattern = "&amp; ",
                            replacement = "& ",
                            rss_feed$items[[i]]$title)
              final_desc <- tags$span(description, tags$br(), tags$a("Read more >", href = rss_feed$items[[i]]$link))
              div(class = i_class,
                  `data-bs-interval` = "10000000",
                  tags$img(src = rss_feed$items[[i]]$thumbnail,
                           class="d-block w-100 post-image",
                           href = rss_feed$items[[i]]$link),
                  div(class="carousel-caption d-none d-md-block bg-desc",
                      h5(new_title),
                      final_desc
                  )
              )
            }
          )
        )
    ),
    tags$button(
      class="carousel-control-prev",
      type="button",
      `data-bs-target` = "#carouselMediumPosts",
      `data-bs-slide` = "prev",
      tags$span(class="carousel-control-prev-icon",
                `aria-hidden` = "true"),
      tags$span(class="visually-hidden", "Previous")
    ),
    tags$button(
      class="carousel-control-next",
      type="button",
      `data-bs-target` = "#carouselMediumPosts",
      `data-bs-slide` = "next",
      tags$span(class="carousel-control-next-icon",
                `aria-hidden` = "true"),
      tags$span(class="visually-hidden", "Next")
    )
  )
  
}