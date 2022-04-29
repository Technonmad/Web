/*     Сделать перевод     */

function getWord(){
    var input = document.getElementById('word').value;
    var firstLetter = input.charAt(0);
    var link = location.protocol + '//' + location.host + location.pathname + "dict/" + firstLetter + ".txt";
    if (input == ''){
        document.getElementById('wordsList').innerHTML = '';
        document.getElementById('ru-word').innerHTML = '';
        document.getElementById('trans').innerHTML = '';
    }
    else
        getContent(link, input);
}

function getContent(link, input) {
    var R = new XMLHttpRequest();

    R.onreadystatechange = function () {
        if (R.status == 200)
            uploadDropList(input, R.responseText);
        else
            document.getElementById('wordsList').innerHTML = 'Vvedite slovo na english yazike okey?';
    };

    R.open('GET', link, true);
    R.send(null);
}

function uploadDropList(input, content) {
    var regex = new RegExp(input + "[a-z' ]* \\[[' a-z]*\\] [\.\,\-\_\'\"\@\?\!\:\$ a-zA-Z0-9А-Яа-я()]*", "gmu");
    var newContentArr = content.match(regex);

    document.getElementById('wordsList').innerHTML = '';
    
    getTranslate(newContentArr[0]);

    for (let index = 0; index < +newContentArr.length; index++) {
        document.getElementById('wordsList').innerHTML = document.getElementById('wordsList').innerHTML +
            `<button onclick="getTranslate(\`` + newContentArr[index] + `\`);" class="btn btn-outline-dark ">` + newContentArr[index].split(' ')[0] + `</button>`;
    };

}

function getTranslate(input){
    document.getElementById('wordsList').innerHTML = '';
    document.getElementById('word').value = input.split(' ')[0];
    document.getElementById('trans').innerHTML = input.split(' ')[1];
    document.getElementById('ru-word').innerHTML = input.split(' ')[2];
}

