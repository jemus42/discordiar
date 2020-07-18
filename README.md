# discordiar

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of discordiar is to send simple webhook messages to discord from R.  
At the moment, it does basically just that.  
Just sending messages to a webhook URL.  
Maybe with an embedded image URL.  
Might as well use `curl` at that point.

## Installation

You can install the released version of discordiar from ~~[CRAN](https://CRAN.R-project.org)~~ GitHub with:

``` r
remotes::install_github("jemus42/discordiar")
```

## Example

Send a message to a pre-configured webhook:

```r
library(discordiar)

# You need a webhook URL, you can set one globally or pass one as an argument.
options(discordiar.webhook_url = "<my_webhook_url>")

# These are optional
options(discordiar.username = "MyFancyUsername")
options(discordiar.avatar_url = "thefanciestofavatarURLs")

webhook_send_message(
  message = "Here's a plot",
  embeds = embeds(
    description = "Just another mtcars plot",
    embed_image(url = "url to my image", title = "vroom vroom")
  )
)
```

