<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>◊(page-title (select 'h1 doc))</title>
    <link rel="stylesheet" href="/dist/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="◊(select-from-metas 'description (current-metas))">
  </head>
  <body>

    <header>
      <h1>Tomato Tomato</h1>
      <h2>Coby's blog about code and stuff</h2>
    </header>

    ◊(->html doc)

    <footer>
      ◊(define prev-page (previous here))
      ◊when/splice[prev-page]{<a href="◊|prev-page|">◊(select 'h1 prev-page)</a>}
      ◊(define next-page (next here))
      ◊when/splice[next-page]{<a href="◊|next-page|">◊(select 'h1 next-page)</a>}
    </footer>

    <script src="/dist/app.js"></script>

  </body>
</html>
