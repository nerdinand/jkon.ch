window.addEventListener('scroll', function() {
    // document.getElementById('showScroll').innerHTML = pageYOffset + 'px';
    this.console.log(this.pageYOffset);
    if (this.pageYOffset > 50) {
        document.getElementById("jkon-logo").style.display = "none";
  } else {
      this.document.getElementById("jkon-logo").style.display = "block";
  }
});

