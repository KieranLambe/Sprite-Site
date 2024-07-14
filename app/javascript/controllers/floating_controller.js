import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["element"];
  static values = { offset: Number };

  initialize() {
    this.scrollHandler = this.scrollHandler.bind(this);
    this.positions = {};
    console.log("Floating controller initialized");
  }

  connect() {
    window.addEventListener("scroll", this.scrollHandler);
    this.elementTargets.forEach((element, index) => {
      this.positions[index] = 0;
    });
    console.log("Floating controller connected");
  }

  disconnect() {
    window.removeEventListener("scroll", this.scrollHandler);
  }

  scrollHandler() {
    const scrollDirection = window.scrollY > this.lastScroll ? 1 : -1;
    this.lastScroll = window.scrollY;
    console.log("Scroll event detected");

    this.elementTargets.forEach((element, index) => {
      const maxOffset = parseInt(element.dataset.offset) || 20;
      let position = this.positions[index] || 0;

      position += scrollDirection * 2;

      if (Math.abs(position) >= maxOffset) {
        position = 0;
      }

      element.style.transform = `translateY(${position}px)`;
      console.log(`Element ${index} position: ${position}px`);
      this.positions[index] = position;
    });
  }
}
