// on load
const accord = document.querySelector(".footer_accord");
const nonAccord = document.querySelector(".footer_non_accord");
if (window.innerWidth < 768) {
  accord.style.display = "block";
  nonAccord.style.display = "none";
} else {
  accord.style.display = "none";
  nonAccord.style.display = "grid";
}

// after load
window.addEventListener("resize", (event) => {
  const accord = document.querySelector(".footer_accord");
  const nonAccord = document.querySelector(".footer_non_accord");

  if (window.innerWidth < 768) {
    accord.style.display = "block";
    nonAccord.style.display = "none";
  } else {
    accord.style.display = "none";
    nonAccord.style.display = "grid";
  }
});
