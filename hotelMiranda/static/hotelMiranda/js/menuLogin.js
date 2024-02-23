
const buttonLogin = document.getElementById('login')
const icon = buttonLogin.firstElementChild
const menuLogin = document.querySelector('.header__content__menu-login')


const openMenuLogin = () => {

    buttonLogin.removeChild(icon)

    const crossIcon = document.createElement('i')
    buttonLogin.appendChild(crossIcon)
    buttonLogin.firstElementChild.classList.add(...['fa-solid', 'fa-xmark', 'header__content__icons__icon__cross-icon'])
    menuLogin.classList.add('header__content__menu-login--display')


}

const closeMenuLogin = () => {


}



buttonLogin.addEventListener('click', () => {
    openMenuLogin()
})
