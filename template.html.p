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
      <a href="/"><h1>Tomato Tomato</h1></a>
      <h2>On code, and sometimes other things, by Coby Tamayo</h2>
    </header>

    ◊(->html doc)

    <footer>
      <nav>
        ◊(rel-link "prev" (previous here))
        ◊(rel-link "next" (next here))
        <hr>
        <a href="/">Home</a>
        <a href="/about.html">About</a>
      </nav>
    </footer>

    <script src="/dist/app.js"></script>

  </body>
</html>
