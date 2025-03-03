function animate(event) {
  let rotation = (event.clientX / 2) % 360
  document.getElementById("logo").style.transform = `rotate(${rotation}deg)`;
}

function shuffle(array) {
  let currentIndex = array.length;

  // While there remain elements to shuffle...
  while (currentIndex != 0) {

    // Pick a remaining element...
    let randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex--;

    // And swap it with the current element.
    [array[currentIndex], array[randomIndex]] = [
      array[randomIndex], array[currentIndex]];
  }
}

function randomize() {
  let element = document.getElementsByClassName("randomize-names")[0];
  if (element == undefined) {
    return;
  }
  let names = element.innerText.split(", ")
  shuffle(names);
  element.innerText = names.join(", ");
}

function installListener() {
  document.getElementsByTagName("body")[0].addEventListener("mousemove", animate)
  
  randomize();
}
