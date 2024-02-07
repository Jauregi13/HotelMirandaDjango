


/* ------------- PAGINATION MENU HOME ------------------------ */

const buttonPrev = document.getElementsByClassName('home-content__menu__info__pagination__buttons__button')[0]
const buttonNext = document.getElementsByClassName('home-content__menu__info__pagination__buttons__button')[1]
const menuItems = document.getElementsByClassName('home-content__menu__info__list__item')
let activeItems = 0;
let firstIndexItem = 0;
let lastIndexItem = 0;
let actualItemsToDisplay = [];
const menuItemsArray = [...menuItems]

document.addEventListener('DOMContentLoaded', () => {

    ['resize','load'].forEach(event => {
    
        window.addEventListener(event, () => {
    
            if(window.innerWidth < 1000){
                activeItems = 3
            }
            else {
                activeItems = 6
            }
            firstIndexItem = 0
            lastIndexItem = activeItems

            buttonPrev.classList.add('button--pagination--inactive')
            buttonNext.classList.remove('button--pagination--inactive')

            menuItemsArray.forEach(element => {
                element.classList.remove('home-content__menu__info__list__item--active')
            })
        
            actualItemsToDisplay = menuItemsArray.slice(firstIndexItem,lastIndexItem);
            actualItemsToDisplay.forEach((element) => {
                element.classList.add('home-content__menu__info__list__item--active')
            })
        })
    });
})

const nextMenuList = () => {

    buttonPrev.classList.remove('button--pagination--inactive')
    buttonPrev.disabled = false

    actualItemsToDisplay.forEach((element) => {
        element.classList.remove('home-content__menu__info__list__item--active')
    })

    firstIndexItem = lastIndexItem
    lastIndexItem += activeItems

    actualItemsToDisplay = menuItemsArray.slice(firstIndexItem,lastIndexItem)
    
    actualItemsToDisplay.forEach((element) => {
        element.classList.add('home-content__menu__info__list__item--active')
    })

    if(lastIndexItem == menuItemsArray.length){
        buttonNext.classList.add('button--pagination--inactive')
        buttonNext.disabled = true
    }

}

const prevMenuList = () => {

    buttonNext.classList.remove('button--pagination--inactive')
    buttonNext.disabled = false

    actualItemsToDisplay.forEach((element) => {
        element.classList.remove('home-content__menu__info__list__item--active')
    })
    lastIndexItem = firstIndexItem
    firstIndexItem -= activeItems

    actualItemsToDisplay = menuItemsArray.slice(firstIndexItem,lastIndexItem)

    actualItemsToDisplay.forEach((element) => {
        element.classList.add('home-content__menu__info__list__item--active')
    })

    if(firstIndexItem === 0){
        buttonPrev.classList.add('button--pagination--inactive') 
        buttonPrev.disabled = true
    }


}

buttonNext.addEventListener('click', nextMenuList)
buttonPrev.addEventListener('click', prevMenuList)


