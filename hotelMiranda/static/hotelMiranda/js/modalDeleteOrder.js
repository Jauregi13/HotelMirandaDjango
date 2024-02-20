

const modal = document.querySelector('.delete-order-modal')
const buttonsDelete = document.querySelectorAll('.order-content__view-list__table__body__row__item__icon--delete')
const buttonDeleteConfirmation = document.querySelector('.delete-order-modal__content__buttons__confirm')
const buttonCancelDelete = document.querySelector('.delete-order-modal__content__buttons__cancel')
const titleModal = document.querySelector('.delete-order-modal__content__title p')

const openModal = (orderId) => {

    modal.classList.add('delete-order-modal--display')
    buttonDeleteConfirmation.href = '/orders/' + orderId + '/delete'
    titleModal.innerHTML = `Are you sure you want to delete the order with ID ${orderId}?`
}


const closeModal = () => {

    modal.classList.remove('delete-order-modal--display')

}

buttonsDelete.forEach( button => {

    button.addEventListener('click', (event) => {
        event.stopPropagation()
        openModal(button.dataset.orderId)
    })
})

buttonCancelDelete.addEventListener('click', () => {
    closeModal()
})

window.addEventListener('click',(element) => {
    let modalContent = document.querySelector('.delete-order-modal__content')

    if(element.target !== modalContent){
        closeModal()
    }
})