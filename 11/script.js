
function getWord(){
    var input = document.getElementById('word').value;
    console.log(input);
    var firstLetter = input.charAt(0);
    var link = location.protocol + '//' + location.host + location.pathname + "dict/" + firstLetter + ".txt";
    console.log(link);
    if (input != '' && event.keyCode == 13){
        getContent(link, input, true);
    }
    else if(input != "" && event.keyCode != 13){
        getContent(link, input);
    }
    else{
        document.getElementById('wordsList').innerHTML = '';
        document.getElementById('ru-word').innerHTML = '';
        document.getElementById('trans').innerHTML = '';
    }
}

function getContent(link, input, translate = false) {
    var R = new XMLHttpRequest();

    R.onreadystatechange = function () {
        if (R.status == 200){
            uploadDropList(input, R.responseText, translate);
            console.log(R.responseText);
        }
            
        else
            document.getElementById('wordsList').innerHTML = 'Слово не найдено';
    };

    R.open('GET', link, true);
    R.send(null);
}

function uploadDropList(input, content, translate) {

    //g - все совпадения, m - multiline, u - full unicode support, i - не чувствителен к регистру
    var regex = new RegExp(input + "[a-z' ]* \\[[' a-z]*\\] [\.\,\-\_\'\"\@\?\!\:\$ a-zA-Z0-9А-Яа-я()]*", "gmui"); 
    var newContentArr = content.match(regex);

    console.log("hey\n" + newContentArr[0]);
    console.log("hey2\n" + newContentArr.length);

    document.getElementById('wordsList').innerHTML = '';
    
    if (translate)
        getTranslate(newContentArr[0]);
    else{

        for (let index = 0; index < newContentArr.length; index++) {
        document.getElementById('wordsList').innerHTML = document.getElementById('wordsList').innerHTML +
            `<button onclick="getTranslate(\`` + newContentArr[index] + `\`);" class="btn btn-outline-dark ">` + newContentArr[index].split(' ')[0] + `</button>`;
        };
    }
    

}

function getTranslate(input){
    document.getElementById('wordsList').innerHTML = '';
    document.getElementById('word').value = input.split(' ')[0];
    document.getElementById('trans').value = input.split(' ')[1];
    document.getElementById('ru-word').value = input.split(' ')[2];
}

