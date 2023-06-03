unit module markdown;

grammar MarkDown is export {
    token TOP { [
                       || <shebang>
                       || <comment>
                       || <part>
                 ]* }
    token shebang { \s* '#!' \N+ <.lineend> }
    token comment { \s* '//' \N+ <.lineend> }
    proto regex part         {*}
          regex part:sym<header> {
              '#'+                       # opening '##'
              \N+                        # other stuffs
          }
          regex part:sym<unordered_list> {
              <unordered_item>+
          }

    token unordered_item { \s* '*' \s+ \N+ <.lineend> }
    token lineend { [\n | $] }
}
