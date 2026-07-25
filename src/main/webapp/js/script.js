function toggleMenu(btn) {
  let dropdown = btn.nextElementSibling;

  document.querySelectorAll(".dropdown").forEach(d => {
    if(d !== dropdown) d.style.display = "none";
  });

  dropdown.style.display =
    dropdown.style.display === "block" ? "none" : "block";
}

window.onclick = function(e) {
  if (!e.target.matches('.menu-btn')) {
    document.querySelectorAll(".dropdown").forEach(d => {
      d.style.display = "none";
    });
  }
}