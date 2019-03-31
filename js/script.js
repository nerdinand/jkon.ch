window.addEventListener('scroll', function() {
    // document.getElementById('showScroll').innerHTML = pageYOffset + 'px';
    // this.console.log(this.pageYOffset);
  if (this.pageYOffset > 50) {
      document.getElementById("jkon-logo").style.display = "none";
  } else {
      this.document.getElementById("jkon-logo").style.display = "block";
  }
});

function initalize(){
  document.getElementsByClassName('username')[0].innerText = 'facebook: jungekunstolten'
  document.getElementsByClassName('username')[1].innerText = 'instagram: jkonolten'
};