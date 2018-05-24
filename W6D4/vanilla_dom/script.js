document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const addPlace = (e) => {
    e.preventDefault();
    const placeInputEl = document.getElementsByClassName("favorite-input")[0];
    const placeToAdd = placeInputEl.value;

    const ul = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = placeToAdd;
    ul.appendChild(li);
    placeInputEl.value = "";
  }

  const listContainer = document.getElementsByClassName("list-container")[0];
  const placeFormEl = listContainer.querySelectorAll("form")[0];
  placeFormEl.addEventListener("submit", addPlace)

  // adding new photos

  // --- your code here!
  const toggleHidden = (el) => {
    if (el.classList.contains("hidden")) {
      el.classList.remove("hidden");
    } else {
      el.classList.add("hidden");
    }
  }
  const addPhoto = (e) => {
    e.preventDefault();
    const photoInputEl = document.getElementsByClassName("photo-url-input")[0];
    const url = photoInputEl.value;

    const ul = document.getElementsByClassName("dog-photos")[0];
    const li = document.createElement("li");
    const img = document.createElement("img");
    img.setAttribute("src", url);

    li.appendChild(img);
    ul.appendChild(li);
    photoInputEl.value = "";
  }

  const toggleButton = document.getElementsByClassName("photo-show-button")[0];
  const photoFormDiv = document.getElementsByClassName("photo-form-container")[0];
  toggleButton.addEventListener("click", (e) => {
    e.preventDefault();
    toggleHidden(photoFormDiv);
  })

  const photoFormEl = photoFormDiv.querySelectorAll("form")[0];
  photoFormEl.addEventListener("submit", addPhoto)


});
