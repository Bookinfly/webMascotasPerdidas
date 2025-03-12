alert("proyecto de estudio en construcción")

// Protección del email
document.getElementById("email").innerHTML = "<a href=''>bookinfly&#64;gmail&#46;com</a>";

// Protección del teléfono
var telArray = ['+54', '11', '2394', '4463'];
document.getElementById("telefono").innerHTML = telArray.join("-");

const menuMobile = document.getElementById('menuMobile');
const menuBars = document.getElementById('menuBars');
const filtrosAvanzados = document.getElementById('filtrosAvanzados');
const botonFiltrosAvanzados = document.getElementById('botonFiltrosAvanzados');
const anuncios = document.getElementsByClassName('anuncios');
const lupa = document.getElementById('lupa');



menuBars.addEventListener("click", (e)=>{
  e.preventDefault();
  if (menuMobile.style.display == 'none' || menuMobile.style.display === '') {
    menuMobile.style.display = 'inline-block';
  } else {
    menuMobile.style.display = 'none';
  }
})

botonFiltrosAvanzados.addEventListener("click", (e) => {
  e.preventDefault();
    if (filtrosAvanzados.style.display == 'none' || filtrosAvanzados.style.display === '') {
    filtrosAvanzados.style.display = 'block';
  } else {
    filtrosAvanzados.style.display = 'none';
  }
})