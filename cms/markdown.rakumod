
grammar MarkDownParagraph {
    regex TOP { .+ <paragraph_end> }
    token paragraph_end { || \n \s* \n
                          || $ }

}

grammar MarkDown {
    regex TOP { <part>+ }
    regex part { [
                       || <shebang>
                       || <comment>
                       || <paragraph>
                 ]+ }
    regex shebang { \s* '#!' \N+ [\n | $] }
    regex comment { \s* '#' \N+ [\n | $] }
    regex paragraph { <MarkDownParagraph::TOP> }
}
