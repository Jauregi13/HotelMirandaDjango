
const loginButton = document.getElementById('login')
const loginIcon = loginButton.firstElementChild
const menuLogin = document.querySelector('.header__content__menu-login')

const openMenuLogin = () => {

    menuLogin.classList.add('header__content__menu-login--display')


}

const closeMenuLogin = () => {

    menuLogin.classList.remove('header__content__menu-login--display')
}



loginButton.addEventListener('click', (event) => {

    event.stopPropagation()
    openMenuLogin()
})

window.addEventListener('click', (event) => {
    console.log(event.target);
    if(event.target !== menuLogin || event.target === loginButton){
        closeMenuLogin()
    }
})


