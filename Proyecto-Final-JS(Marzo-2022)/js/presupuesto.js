//Variables globales

let formulario = document.querySelector('#Formulario')

let selectProduct = document.querySelector('#noSelect')
let productos = document.querySelector('#productos');
let espuma = document.querySelector('#espuma')
let gomina = document.querySelector('#gomina')
let keratina = document.querySelector('#keratina');
let laca = document.querySelector('#laca')

let embalajePremium = document.querySelector('#embalajePremium');

let envioPremium = document.querySelector('#envioPremium');

let fecha = document.querySelector('#fecha');


let nombrePersonalizado = document.querySelector('#nombrePersonalizado');

let presupuestoActual = document.querySelector('#presupuestoActual');
let presupuestoTotal = 0;



let nombre = document.querySelector('#nombre');
let apellidos = document.querySelector('#apellidos');
let numeroDeTelefono = document.querySelector('#numerotlf');
let email = document.querySelector('#email');
let politica = document.querySelector('#politica');

let requisitos = document.querySelector('#requisitos');


//Event listeners

productos.addEventListener('change', seleccionarProducto);

embalajePremium.addEventListener('click', calcularEmbalajePremium);
envioPremium.addEventListener('click', calcularEnvioPremium);
nombrePersonalizado.addEventListener('click', calcularNombrePersonalizado);
fecha.addEventListener('change', recibirProducto);


formulario.addEventListener('submit', validarDatos);


//Funciones

//Función que valida los datos del formulario

function validarDatos(e) {

    //Variables locales

    let ok = 'si';

    let mensajeNombre = '';
    let mensajeApellidos = '';
    let mensajeNumeroTlf = '';
    let mensajeEmail = '';

    let mensajePolitica = '';
    let ProductoNoSeleccionado = '‼️No has seleccionado ningún producto';
    let mensajeFecha = ''

    //Validando el nombre

    re = /^[a-zA-Z]{3,13}$/;


    if (nombre.value == '') {
        ok = 'no';
        mensajeNombre = mensajeNombre + '‼️Debes insertar tu nombre para continuar.'
    } else {

        if (!re.exec(nombre.value)) {
            ok = 'no';
            mensajeNombre = mensajeNombre + '‼️Debe ser un nombre correcto.'
        }
    }


    //Validando apellidos

    re = /^[a-z A-z]{7,30}$/;

    if (apellidos.value == '') {
        ok = 'no';
        mensajeApellidos = mensajeApellidos + '‼️Inserta tus apellidos por favor.'
    } else {

        if (!re.exec(apellidos.value)) {
            ok = 'no';
            mensajeApellidos = mensajeApellidos + '‼️Los apellidos deben ser correctos.'
        }
    }

    //Validando la fecha

    if (fecha.value == '') {
        ok = 'no';
        mensajeFecha = mensajeFecha + '‼️Debes seleccionar en cuántos días quieres recibir el producto'
    } else {
        parseInt(fecha.value)
        if (fecha.value > 21) {
            ok = 'no';
            mensajeFecha = mensajeFecha + '‼️Aceptamos pedidos con un plazo máximo de entrega de 21 días'
        }
    }


    //Validando el telefono

    //ALERTA! IMPORTAN LOS ESPACIOS EN LAS EXPRESIONES REGULARES!!

    re = /^(6|7|8|9)[0-9]{8}$/

    if (numeroDeTelefono.value == '') {
        ok = 'no';
        mensajeNumeroTlf = mensajeNumeroTlf + '‼️Debes insertar tu número de teléfono.'
    } else {


        if (!re.exec(numeroDeTelefono.value)) {
            ok = 'no';
            mensajeNumeroTlf = mensajeNumeroTlf + '‼️El número de teléfono insertado es erróneo.'
        }

        if (!(/^\d{9}$/.test(numeroDeTelefono.value))) {
            ok = 'no';
            mensajeNumeroTlf = mensajeNumeroTlf + '‼️El telefono debe tener 9 cifras.'
        }
    }


    //Validando el email

    re = /^(.+@.+..+)$/;


    if (!re.exec(email.value)) {
        ok = 'no';
        mensajeEmail = mensajeEmail + '‼️Debe ser un e-mail.';
    }

    else {
        if (!/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(email.value)) {
            ok = 'no';
            mensajeEmail = mensajeEmail + '‼️Debe ser un correo electrónico existente.';
        }
    }

    //Validando la politica

    if (politica.checked == false) {
        ok = 'no';
        mensajePolitica = mensajePolitica + '‼️Debes aceptar la política de privacidad para continuar.'
    }

    if (ok == 'si' && presupuestoActual.value != '') {
        document.formulario.submit();

    }
    else {

        requisitos.innerHTML = '';

        if (mensajeNombre != '') {
            requisitos.innerHTML += `

        <li>${mensajeNombre}</li>
        `
        }
        if (mensajeApellidos != '') {
            requisitos.innerHTML += `

    <li>${mensajeApellidos}</li>
    `
        }

        if (mensajeNumeroTlf != '') {
            requisitos.innerHTML += `

    <li>${mensajeNumeroTlf}</li>
    `
        }

        if (mensajeEmail != '') {
            requisitos.innerHTML += `

    <li>${mensajeEmail}</li>
    `
        }

        if (mensajePolitica != '') {
            requisitos.innerHTML += `

    <li>${mensajePolitica}</li>
    `
        }

        if (selectProduct.selected == true) {
            requisitos.innerHTML += `

        <li>${ProductoNoSeleccionado}</li>
        `
        }

        if (mensajeFecha != '') {
            requisitos.innerHTML += `

        <li>${mensajeFecha}</li>
        `
        }
        e.preventDefault();
    
    $('#requisitos').hide();
    $('#requisitos').fadeIn(1500);
}

}

//Función que modifica los estados de los checkbox/input al seleccionar productos

function seleccionarProducto() {

    if (selectProduct.selected == false) {
        envioPremium.disabled = '';
        embalajePremium.disabled = '';
        nombrePersonalizado.disabled = '';
        fecha.disabled = '';

        envioPremium.checked = false;
        embalajePremium.checked = false;
        nombrePersonalizado.checked = false;

        fecha.value = '';

        presupuestoTotal = parseInt(productos.value);
        presupuestoActual.value = presupuestoTotal;
        presupuestoTotal;

        if (espuma.selected == true || keratina.selected == true || laca.selected == true || gomina.selected == true) {
            nombrePersonalizado.disabled = 'disabled';
        }

    } else {
        presupuestoActual.value = '';

        envioPremium.disabled = 'disabled';
        embalajePremium.disabled = 'disabled';
        nombrePersonalizado.disabled = 'disabled';
        fecha.disabled = 'disabled';

        envioPremium.checked = false;
        embalajePremium.checked = false;
        nombrePersonalizado.checked = false;

        fecha.value = '';
    }

}

//Función que calcula el precio del envío premium al añadirlo y al restarlo

function calcularEnvioPremium() {

    if (selectProduct.selected == false) {

        if (envioPremium.checked == true) {
            presupuestoActual.value = parseInt(envioPremium.value) + presupuestoTotal;
            presupuestoTotal = parseInt(presupuestoActual.value);
        } else if (envioPremium.checked == false) {
            presupuestoTotal = presupuestoTotal - parseInt(envioPremium.value);
            presupuestoActual.value = presupuestoTotal;
        }

    }

}

//Función que calcula el precio del embalaje premium al añadirlo y al restarlo
function calcularEmbalajePremium() {

    if (selectProduct.selected == false) {

        if (embalajePremium.checked == true) {
            presupuestoActual.value = 4 + presupuestoTotal;
            presupuestoTotal = parseInt(presupuestoActual.value);
        } else if (embalajePremium.checked == false) {
            presupuestoTotal = presupuestoTotal - 4;
            presupuestoActual.value = presupuestoTotal;
        }
    }
}

//Función que calcula el precio del nombre personalizado al añadirlo y al restarlo

function calcularNombrePersonalizado() {

    if (selectProduct.selected != true) {

        if (nombrePersonalizado.checked == true) {
            presupuestoActual.value = parseInt(nombrePersonalizado.value) + presupuestoTotal;
            presupuestoTotal = parseInt(presupuestoActual.value);
        } else if (nombrePersonalizado.checked == false) {
            presupuestoTotal = presupuestoTotal - 6;
            presupuestoActual.value = presupuestoTotal;
        }
    }

}



//Función que adapta el presupuesto según a cuando quieras que te tarde en llegar el producto

let discountDays = false
function recibirProducto() {

    let valorIntroducido = '';
    valorIntroducido = valorIntroducido + fecha.value;

    if (valorIntroducido >= 7 && valorIntroducido <= 31 ) {
        presupuestoActual.value = presupuestoTotal - 2;
        presupuestoTotal = parseInt(presupuestoActual.value);
        discountDays = true
    }

    if (discountDays == true && valorIntroducido < 7) {
        presupuestoActual.value = presupuestoTotal + 2;
        presupuestoTotal = parseInt(presupuestoActual.value);
        discountDays = false

    }
}
