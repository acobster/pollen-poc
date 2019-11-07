import FontFaceObserver from 'fontfaceobserver'

/**
 * Use the "FOUT with a Class" strategy for loading webfonts
 * https://www.zachleat.com/web/comprehensive-webfonts/#fout-with-a-class
 */
function FoutLoader(options) {
  if (!options.fontName || !options.fontLoadedClass) {
    throw new Error(
      'fontName or fontLoadedClass missing from FoutLoader arguments!'
    )
  }

  const container = options.container || document.documentElement
  const storedKey = options.localStorageKey || `FoutLoader: ${options.fontName}`

  if (window.localStorage && localStorage.getItem(storedKey)) {
    container.classList.add(options.fontLoadedClass)
  } else {
    const font = new FontFaceObserver(options.fontName)
    font.load().then(() => {
      container.classList.add(options.fontLoadedClass)
      localStorage.setItem(storedKey, 1)
    })
  }
}

export default FoutLoader
