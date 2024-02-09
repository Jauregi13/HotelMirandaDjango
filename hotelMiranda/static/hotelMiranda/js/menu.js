
/** -----MENU------- */

const menuIcon = document.getElementById('menuIcon');
const menu = document.getElementById('menu');

function openMenu(){
    
    menuIcon.firstElementChild.classList.replace('fa-bars','fa-xmark');
    menu.style.display = 'block';

}

function closeMenu(){

    menuIcon.firstElementChild.classList.replace('fa-xmark','fa-bars');
    menu.style.display = 'none';
}

menuIcon.addEventListener('click',() => {
    if(menuIcon.firstElementChild.classList.contains('fa-bars')){
        openMenu();
    }
    else {
        closeMenu();
    }
});