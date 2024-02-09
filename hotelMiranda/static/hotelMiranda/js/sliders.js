
let slidesNumber = window.innerWidth >= 1000 ? 3 : 1

window.addEventListener('resize', () => {
  
  slidesNumber = window.innerWidth >= 1000 ? 3 : 1

  sliderNavigation.params.slidesPerView = slidesNumber
  sliderNavigation.update()
  
})

const sliderNavigation = new Swiper('.slider-type1', {
  // Optional parameters
  direction: 'horizontal',
  loop: true,
  autoHeight: true,
  slidesPerView: slidesNumber,
  spaceBetween: 100,
  // Navigation arrows
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  }
});





const sliderPagination = new Swiper('.slider-type2', {
  
  autoplay: false,
  loop:true,
  autoHeight: true,
  direction: 'horizontal',
  pagination: {
    el: '.swiper-pagination',
    type: 'bullets'
  }


});