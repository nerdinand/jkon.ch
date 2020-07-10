function toggleNavigation() {
  let active = document.querySelector("button.hamburger").classList.toggle("is-active");

  let navList = document.querySelector(".nav-list");

  if (active) {
    navList.style.display = "block";
  } else {
    navList.style.display = "none";
  }
}
