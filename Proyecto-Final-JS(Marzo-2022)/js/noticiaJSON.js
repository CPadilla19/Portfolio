//Noticia con JSON en el index

//AddEventListener que solo se ejecuta una vez
$('#cargar-noticia').one('mouseover', traerDatos)


function traerDatos() {
    const xhttp = new XMLHttpRequest();

    xhttp.open('GET', 'assets/json/noticia.json', true);

    xhttp.send();

    xhttp.onreadystatechange = function () {
        if ( this.readyState == 4 && this.status == 200) {

            let datos = JSON.parse(this.responseText);
            let res = document.querySelector('#res');
            res.innerHTML = '';

            for (let item of datos) {
                res.innerHTML += `
                    <h4>${item.numero_noticia}</h4>
                    <h3>${item.titulo}</h3>
                    <p>${item.fecha}</p>
                    <p>${item.contenido}</p>
                    
                `
            }
            $('#res').hide();
            $('#res').fadeIn(1500);
        }
    }
}
