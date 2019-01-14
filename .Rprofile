
list_bibcodes <- function(sort = TRUE) {
  bibs <- fs::dir_ls(recursive = TRUE, regexp = "[.]bib$")

  for (bib in bibs) {
    refs <- bibtex::read.bib(bib)

    if (sort) {
      refs <- refs[sort(names(refs))]
    }

    titles <- purrr::map_chr(refs, purrr::pluck, 1, "title")

    titles <- stringr::str_replace_all(titles, "\\{|\\}", "")
    titles <- stringr::str_replace_all(titles, "\\s\\s+", " ")

    preview_width <- unlist(options("width")) - max(nchar(names(refs))) - 3
    short_titles <- ifelse(
      nchar(titles) > (preview_width - 3),
      paste0(substr(titles, 1, (preview_width - 3)), "..."),
      titles
    )

    tags <- paste0("[@", names(refs), "]")
    padded <- stringr::str_pad(tags, max(nchar(tags)), "left")
    print(glue::glue(bib))
    print(glue::glue("{padded} {short_titles}"))
  }
}
