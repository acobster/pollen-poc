import FontFaceObserver from 'fontfaceobserver'

new FontFaceObserver('Lato').load().then(() => {
  document.documentElement.classList.add('Lato')
})
new FontFaceObserver('Lora').load().then(() => {
  document.documentElement.classList.add('Lora')
})
