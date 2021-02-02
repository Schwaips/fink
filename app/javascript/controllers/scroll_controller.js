

const initScroll = (gsap, ScrollTrigger) => {
    gsap.registerPlugin(ScrollTrigger);

    gsap.utils.toArray(".card-board").forEach((row) => {
    const tl = gsap.timeline();
    const cards = row.querySelectorAll(".card-lecture");
    const title = row.parentNode.querySelector(".card-lecture-image");
      console.log('Hello');
    ScrollTrigger.create({

      trigger: row,
      start: "+=200px bottom",
      animation: tl
        .to(title, {
          duration: 0.5,
          opacity: 1,
          x: 0,
          ease: "back.out(1.4)"
        })
        .to(cards, {
          duration: 1,
          opacity: 1,
          x: 0,
          ease: "elastic.out(1, 0.75)",
          stagger: { axis: "x", each: 0.04 }
        }, "-=0.2")
    });
  });
};
export { initScroll };
