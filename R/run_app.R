#' Run the app
#'
#' Initiate an instance of the chrisbrownlie.com shiny app. This function will initiate the app stored in
#' inst/app with the runApp function
#'
#' Note: an alias function 'l' is also provided to speed up workflow (after making changes, load them with 'Ctrl+Shift+L',
#' then launch the app with 'l()')
#'
#' @return either run the app as a side effect or return a shiny.appobj object
#'
#' @importFrom shiny runApp
#'
#' @export
run_app <- function() {

  if (interactive()) {
    
    runApp(appDir = system.file("app",
                                package = "chrisbrownlie"))
    
  } else {
    
    shinyAppDir(appDir = system.file("app",
                                     package = "chrisbrownlie"))
    
  }

}

#' @export
l <- run_app
