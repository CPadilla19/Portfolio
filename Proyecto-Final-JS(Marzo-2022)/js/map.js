//Variables Globales
let mapa;
let marker;

//GeoLocalicacion
let watchID;
let geoLoc;

//Calculo de ruta
let mostrar_direcciones;
let botonGeoLoc = document.querySelector('#btnGeoLoc');
let myUbication = document.querySelector('#myUbication');

let btnCopiar = document.querySelector('#btnCopiar');


//Add eventListeners

botonGeoLoc.addEventListener('click', calcularRuta);
btnCopiar.addEventListener('click', copyToClickBoard);

// Funciones

//Función para añadir mapa, marcador y streetView

function initMap() {

    mostrar_direcciones = new google.maps.DirectionsRenderer();

    let punto = { lat: 41.624808377504166, lng: 2.686492769475444 };

    let opciones = {
        zoom: 7,
        center: punto,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    mapa = new google.maps.Map(document.querySelector('#map'), opciones);
    mostrar_direcciones.setMap(mapa);
    mostrar_direcciones.setPanel(document.querySelector('#ruta'));
    marker = new google.maps.Marker({
        position: punto,
        map: mapa,
        animation: google.maps.Animation.DROP
    });

    let caja = new google.maps.InfoWindow({
        content: 'Peluquería <b>MarmotStyle</b><br>Horarios:<br><b>8.00 a 13.30<br>15.30 a 20.00'
    });
    google.maps.event.addListener(marker, 'click', function () {
        caja.open(mapa, marker);
    });
    let opciones_fotos = {
        position: punto,
        pov: {
            heading: 34,
            pitch: 0,
            zoom: 1
        }
    };
    let fotos = new google.maps.StreetViewPanorama(
        document.querySelector("#streetMap"),
        opciones_fotos);
    mapa.setStreetView(streetMap);
}


//Función que calcula la ruta del punto de partida al destino

function calcularRuta() {
    let partida = document.querySelector('#partida').value;
    let destino = document.querySelector('#destino').value;

    let servicios_rutas = new google.maps.DirectionsService();
    let opciones = {
        origin: partida,
        destination: destino,
        travelMode: google.maps.DirectionsTravelMode.DRIVING
    };
    servicios_rutas.route(opciones, function (response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            mostrar_direcciones.setDirections(response);
        }
    });

}


//Quitando estilos al div que genera la ruta

let rutaGenerada = document.getElementById('ruta');

rutaGenerada.style.float = 'none';
rutaGenerada.style.width = 'auto';
rutaGenerada.style.display = 'flex';
rutaGenerada.style.justifyContent = 'center';
rutaGenerada.style.marginBottom = '20px';


//El tick verde queda oculto, para que se pueda reproducir el fadeIn
$('.tickVerde').hide();

function copyToClickBoard() {
    let content = document.querySelector('#copiarCordenadas').innerHTML;

    navigator.clipboard.writeText(content);
    $('.tickVerde').fadeIn(700);
    $('.tickVerde').fadeOut(8500);
}
