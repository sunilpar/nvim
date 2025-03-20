local ls = require 'luasnip'

-- Define Go snippets
ls.add_snippets('go', {
  ls.snippet('iferr', {
    ls.text_node 'if err != nil {',
    ls.snippet_node(1, ls.insert_node(0)), 
    ls.text_node 'return err',
    ls.text_node '}',
  }),
})
