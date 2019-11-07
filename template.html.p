<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>◊(page-title (select 'h1 doc))</title>
    <link href="https://fonts.googleapis.com/css?family=Lato:400,400i|Lora:700,700i&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/dist/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="◊(select-from-metas 'description (current-metas))">
  </head>
  <body>

    <header>
      <a href="/">
        <h1><img src="/src/img/tomato.svg" alt="Tomato Logo"> Tomato Tomato</h1>
      </a>
      <h2>Coby's blog about code, and sometimes other things</h2>
    </header>

    <main>
      ◊(->html doc)
        ◊(if (or (previous here) (next here)) {
          <nav>
            ◊(rel-link "prev" (previous here))
            ◊(rel-link "next" (next here))
          </nav>
        } "")
      <hr>
    </main>

    <footer>
      <nav>
        <a href="/">Home</a>
        <a href="/about.html">About</a>
      </nav>

      <aside>
        <p><span class="copyleft">©</span> 2019 Coby Tamayo</p>
        <p>Creative Commons License (<a href="https://creativecommons.org/licenses/by-sa/4.0/">CC BY-SA 4.0</a>)</p>
        <p>This site was built using <a href="https://docs.racket-lang.org/pollen/">Pollen</a></p>
      </aside>
    </footer>

    <script src="/dist/app.js"></script>

  </body>
</html>
