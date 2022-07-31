# Set variables which are available at the beginning of all sessions
print("Running global")
sass::sass(
  sass::sass_file(system.file("app/www/styling.scss", package = "chrisbrownlie")),
  output = system.file("app/www/styling.css", package = "chrisbrownlie")
)
print("end global")