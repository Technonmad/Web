function getPageData(url)
{
    var R = new XMLHttpRequest();
    R.open('GET',url,true);
    R.send();
    R.onreadystatechange = function(){
        if(R.readyState == 4){
            if(R.status == 200){
                document.getElementById('content').innerHTML = R.responseText;
            }
        }
    }
    saveState(url);
}

function saveState(pageUrl){

    if (pageUrl == "./pages/01.html") {
        window.location.hash = "state1";
    }
    if (pageUrl == "./pages/02.html") {
        window.location.hash = "state2";
    }
    if (pageUrl == "./pages/03.html") {
        window.location.hash = "state3";
    }
}

function checkHash() {
	if (window.location.hash == "#state1") {
		getPageData("./pages/01.html");
	}
    if (window.location.hash == "#state2") {
		getPageData("./pages/02.html");
	}
    if (window.location.hash == "#state3") {
		getPageData("./pages/03.html");
	}
   // window.location.reload();
}
