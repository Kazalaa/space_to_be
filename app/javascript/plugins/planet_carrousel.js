// require "greensock/TweenLite" ;
// require 'greensock/easing/EasePack' ;
// require 'greensock/jquery.gsap.js' ;
import { TimelineMax, CSSPlugin, ScrollToPlugin, Draggable } from "gsap/all";
import { gsap } from "gsap";
// const planet = document.querySelector(".planet")
// const container = document.querySelector(".container-carroussel")
// const selectplanet1 = document.getElementById(planet1)
// const selectplanet2 = document.getElementById(planet2)
// const selectplanet3 = document.getElementById(planet3)

// planet.addEventListener("click", (event) => {
//   event.classList.add("planet-center");
//   if (planet.id == selectplanet1) centerPlanet1();
//   if (planet.id == selectplanet2) centerPlanet2();
//   if (planet.id == selectplanet3) centerPlanet3();

// });


// function centerPlanet1() {
//   const tl = new TimelineMax()
//     .to('#planet1', 1, { xPercent: 0, z: 1 }, 0)
//     .to('#planet2', 1, { xPercent: 140, z: -800 }, 0)
//     .to('#planet3', 1, { xPercent: -140, z: -800 }, 0)

// }

// function centerPlanet2() {
//   const tl = new TimelineMax()
//     .to('#planet1', 1, { xPercent: -140, z: -800 }, 0)
//     .to('#planet2', 1, { xPercent: 0, z: 1 }, 0)
//     .to('#planet3', 1, { xPercent: 140, z: -800 }, 0);
// }

// function centerPlanet3() {
//   const tl = new TimelineMax()
//     .to('#planet1', 1, { xPercent: 140, z: -800 }, 0)
//     .to('#planet2', 1, { xPercent: -140, z: -800 }, 0)
//     .to('#planet3', 1, { xPercent: 0, z: 1 }, 0);
// }

// $(function () {
  //   centerPlanet2();
  // });
function centerPlanet1() {
  const tl = gsap.timeline();
  tl.to("#planet1", 1, { xPercent: 0, yPercent: 0, z: 1 }, 0)
  tl.to("#planet2", 1, { xPercent: 80, yPercent: -50, z: -600 }, 0);
  tl.to("#planet3", 1, { xPercent: 70, yPercent: -200, z: -1500 }, 0)
  tl.to("#planet4", 1, { xPercent: 1 - 70, yPercent: -200, z: -1500 }, 0);
  tl.to("#planet5", 1, { xPercent: -80, yPercent: -50, z: -600 }, 0)
}

function centerPlanet2() {
  var tl = gsap.timeline();
  tl.to("#planet1", 1, { xPercent: -80, yPercent: -50, z: -600 }, 0)
  tl.to("#planet2", 1, { xPercent: 0, yPercent: 0, z: 1 }, 0)
  tl.to("#planet3", 1, { xPercent: 80, yPercent: -50, z: -600 }, 0);
  tl.to("#planet4", 1, { xPercent: 70, yPercent: -200, z: -1500 }, 0)
  tl.to("#planet5", 1, { xPercent: 1 - 70, yPercent: -200, z: -1500 }, 0);
}

function centerPlanet3() {
  var tl = gsap.timeline();
  tl.to("#planet1", 1, { xPercent: 1 - 70, yPercent: -200, z: -1500 }, 0);
  tl.to("#planet2", 1, { xPercent: -80, yPercent: -50, z: -600 }, 0)
  tl.to("#planet3", 1, { xPercent: 0, yPercent: 0, z: 1 }, 0);
  tl.to("#planet4", 1, { xPercent: 80, yPercent: -50, z: -600 }, 0);
  tl.to("#planet5", 1, { xPercent: 70, yPercent: -200, z: -1500 }, 0);
}

function centerPlanet4() {
  var tl = gsap.timeline();
  tl.to("#planet1", 1, { xPercent: 70, yPercent: -200, z: -1500 }, 0);
  tl.to("#planet2", 1, { xPercent: 1 - 70, yPercent: -200, z: -1500 }, 0);
  tl.to("#planet3", 1, { xPercent: -80, yPercent: -50, z: -600 }, 0)
  tl.to("#planet4", 1, { xPercent: 0, yPercent: 0, z: 1 }, 0);
  tl.to("#planet5", 1, { xPercent: 80, yPercent: -50, z: -600 }, 0);
}

function centerPlanet5() {
  var tl = gsap.timeline();
  tl.to("#planet1", 1, { xPercent: 80, yPercent: -50, z: -600 }, 0);
  tl.to("#planet2", 1, { xPercent: 70, yPercent: -200, z: -1500 }, 0);
  tl.to("#planet3", 1, { xPercent: 1 - 70, yPercent: -200, z: -1500 }, 0);
  tl.to("#planet4", 1, { xPercent: -80, yPercent: -50, z: -600 }, 0)
  tl.to("#planet5", 1, { xPercent: 0, yPercent: 0, z: 1 }, 0);
}

const centerplanet = () => {
  const container = document.querySelector(".container-carroussel")
  let planet = document.querySelector(".planet");
  centerPlanet2();
  document.querySelectorAll(".planet").forEach((planet) => {
    planet.addEventListener("click", (e) => {
      document.querySelector(".container").setAttribute("planet-center", planet.id);
      if (planet.id == "planet1") centerPlanet1();
      if (planet.id == "planet2") centerPlanet2();
      if (planet.id == "planet3") centerPlanet3();
      if (planet.id == "planet4") centerPlanet4();
      if (planet.id == "planet5") centerPlanet5();
    });
  })
};

export { centerplanet };
