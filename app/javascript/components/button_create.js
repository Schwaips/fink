const initButton = () => {
  const button = document.querySelectorAll('.plus-btn')
  if (button) {
    button.forEach((but) => {
      but.addEventListener('mouseover', (event) => {

        console.log('Hello');
        but.innerHTML = `Créer un nouveau cours`;
      });
    but.addEventListener('mouseleave', (event) => {
        console.log('Goodbye');
        but.innerHTML = `<i class="fas fa-plus"></i>`;
      });
    }
  )}
}

export { initButton };
