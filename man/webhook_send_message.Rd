% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/webhook.R
\name{webhook_send_message}
\alias{webhook_send_message}
\title{Send a message via a webhook}
\source{
\url{https://discord.com/developers/docs/resources/webhook#execute-webhook}
}
\usage{
webhook_send_message(
  webhook_url = NULL,
  message = NULL,
  username = NULL,
  embeds = NULL,
  avatar_url = NULL,
  ...
)
}
\arguments{
\item{webhook_url}{A valid webhook URL as copied from a server's webhook
settings screen.}

\item{message}{Character string of message to send, limited to 2000 characters.}

\item{username}{Discord username to display with the message.}

\item{embeds}{Embedded objects created via \code{\link[=embeds]{embeds()}}.}

\item{avatar_url}{A valid URL to an avatar to be displayed with the username.}

\item{...}{Other arguments passed to JSON/Form Params.}
}
\value{
Nothing
}
\description{
Send a message via a webhook
}
\examples{
\dontrun{
webhook_url <- "https://discordapp.com/api/webhooks/<id>/<token>"

webhook_send_message(
  webhook_url = webhook_url,
  message = "Hello world!"
)

# Embedding an image
webhook_send_message(
  webhook_url = webhook_url,
  username = "Gargamel",
  message = "Hello there",
  embeds = embeds(
    description = "Just another mtcars",
    embed_image(url = image_url, title = "WHEEEEE")
  )
)
}
}
