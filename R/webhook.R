#' Send a message via a webhook
#'
#' @param webhook_url A valid webhook URL as copied from a server's webhook
#'   settings screen.
#' @param message Character string of message to send, limited to 2000 characters.
#' @param username Discord username to display with the message.
#' @param embeds Embedded objects created via [`embeds()`].
#' @param avatar_url A valid URL to an avatar to be displayed with the username.
#' @param ... Other arguments passed to JSON/Form Params.
#'
#' @return Nothing
#' @export
#' @source <https://discord.com/developers/docs/resources/webhook#execute-webhook>
#' @examples
#' \dontrun{
#' webhook_url <- "https://discordapp.com/api/webhooks/<id>/<token>"
#'
#' webhook_send_message(
#'   webhook_url = webhook_url,
#'   message = "Hello world!"
#' )
#'
#' # Embedding an image
#' webhook_send_message(
#'   webhook_url = webhook_url,
#'   username = "Gargamel",
#'   message = "Hello there",
#'   embeds = embeds(
#'     description = "Just another mtcars",
#'     embed_image(url = image_url, title = "WHEEEEE")
#'   )
#')
#'}
webhook_send_message <- function(
  webhook_url = NULL, message = NULL, username = NULL,
  embeds = NULL, avatar_url = NULL,
  ...
  ) {

  if (is.null(webhook_url)) webhook_url <- getOption("discordiar.webhook_url")
  if (is.null(username)) username <- getOption("discordiar.username")
  if (is.null(avatar_url)) avatar_url <- getOption("discordiar.avatar_url")

  if (is.null(webhook_urk)) stop("No webhook_url supplied")

  httr::POST(
    url = webhook_url,
    body = list(
      username = username,
      avatar_url = avatar_url,
      content = message,
      embeds = embeds,
      ...
    ),
    encode = "json"
  )
}

#' Embed content with a message
#'
#' Multiple images and other content can be embedded in the same message,
#' which is why there's not just one big "embed image" that returns the
#' correct structure.
#' @param description Optional: Character string to use as description.
#' @param ... Embedded content, i.e. [`embed_image()`] objects.
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#' embeds = embeds(
#'   description = "Just another mtcars",
#'   embed_image(url = "https://i.imgur.com/TUdNWOW.png", title = "vroom")
#' )
#' }
embeds <- function(description = NULL, ...) {
  list(
    list(description = description),
    ...
  )
}

#' @rdname embeds
#' @param url An image URL to embed.
#' @param title Title to be displayed above image.
#' @export
embed_image <- function(url, title = NULL) {
  list(
    title = title,
    image = list(url = url)
  )
}
