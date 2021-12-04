import { Controller } from "@hotwired/stimulus"
//import { throttle } from "lodash"

export default class extends Controller {
  
  static values = { throttleDelay: Number }
  
  initialize () {
    this.scroll = this.scroll.bind(this)
  }
    
  connect () {
    const delay = this.throttleDelayValue || 15

    if (delay > 0) {
      this.scroll = this.throttle(this.scroll, delay)
    }

    window.addEventListener('scroll', this.scroll, { passive: true })
    this.scroll()
  }

  disconnect () {
    window.removeEventListener('scroll', this.scroll)
  }

  scroll () {
    const height = document.documentElement.scrollHeight - document.documentElement.clientHeight
    const width = (window.scrollY / height) * 100

    this.element.style.width = `${width}%`
  }
  
  throttle(func, timeFrame) {
    var lastTime = 0;
    return function (...args) {
        var now = new Date();
        if (now - lastTime >= timeFrame) {
            func(...args);
            lastTime = now;
        }
    };
  }
}