import * as bootstrap from "bootstrap";

document.addEventListener("turbolinks:load", () => {
  const toastElList = [].slice.call(document.querySelectorAll(".toast"));
  toastElList.map(function (toastEl) {
    return new bootstrap.Toast(toastEl).show();
  });
});
