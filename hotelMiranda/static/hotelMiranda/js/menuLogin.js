
const loginButton = document.getElementById('login')
const loginIcon = loginButton.firstElementChild
const menuLogin = document.querySelector('.header__content__menu-login')
const crossIcon = document.createElement('i')
crossIcon.classList.add(...['fa-solid', 'fa-xmark', 'fa-xl', 'fa-xl--remove-line-height'])

const openMenuLogin = () => {

    loginButton.removeChild(loginIcon)
    loginButton.appendChild(crossIcon)
    menuLogin.classList.add('header__content__menu-login--display')


}

const closeMenuLogin = () => {

    loginButton.removeChild(crossIcon)
    loginButton.appendChild(loginIcon)
    menuLogin.classList.remove('header__content__menu-login--display')
}



loginButton.addEventListener('click', () => {

    console.log(loginButton.firstElementChild.className);
    if(loginButton.firstElementChild.className === 'header__content__icons__icon__login'){
        openMenuLogin()
    }
    else {
        console.log('close');
        closeMenuLogin()
    }
    
})


