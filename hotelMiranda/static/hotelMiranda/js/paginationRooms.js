const buttonFirst = document.getElementById('buttonPrev')
let buttonLast = document.getElementById('buttonNext')
const rooms = document.getElementsByClassName('rooms-content__room')
const roomsArray = [...rooms]
let roomsToDisplay = []
const paginationElement = document.querySelector('.pagination-rooms')
let buttons = []
let activeRooms = 0;
let activePage
let indexRanges = []

document.addEventListener('DOMContentLoaded', () => {

    ['resize','load'].forEach((event) => {

        let newActiveRooms;

        window.addEventListener(event, () => {

            if(window.innerWidth < 1450){
                newActiveRooms = 6
            }
            else {
                newActiveRooms = 12
            }

            // Comprobar que se actualiza el numero de habitaciones a visualizar
            if(newActiveRooms != activeRooms){

                activeRooms = newActiveRooms

                let buttonNumbers = Math.ceil(roomsArray.length / activeRooms)

                updateIndexRangePage(activeRooms,buttonNumbers)

                updateRoomList(1)

                buttonFirst.disabled = true
                buttonLast.disabled = false
                buttonFirst.classList.add('button--pagination--inactive')
                buttonLast.classList.remove('button--pagination--inactive')
                
                resetButtons()

                buttons.forEach((button,index) => {

                    button.addEventListener('click', () => {
                
                        changePageRoom(index+1)
                    })
                })
            }

            
        })
    })
})

const updateIndexRangePage = (activeRooms,pages) => {

    let firstIndexRoom = 0
    let lastIndexRoom = activeRooms

    indexRanges = []
    
    for (let index = 0; index < pages; index++) {

        indexRanges.push({
            firstIndex : firstIndexRoom,
            lastIndex: lastIndexRoom
        })

        firstIndexRoom = lastIndexRoom
        lastIndexRoom += activeRooms 
    }
}

const updateRoomList = (actualPage) => {

    // Elimino la clase active a todas las habitaciones
    roomsArray.forEach((room) => {
        room.classList.remove('rooms-content__room--active')
    })

    roomsToDisplay = roomsArray.slice(indexRanges[actualPage-1].firstIndex,indexRanges[actualPage-1].lastIndex)

    // Añado la clase active a las habitaciones que se tienen que mostrar en la página actual
    roomsToDisplay.forEach((room) => {
        room.classList.add('rooms-content__room--active')
    })

}

const resetButtons = () => {

    // Los elementos de la paginación en formato array
    buttons = Array.from(paginationElement.children)
    
    // Eliminar los elementos del array que no sean el número, solo quiero los numeros de paginación
    buttons.forEach((button) => {

        if(button.innerHTML !== '&lt;&lt;' && button.innerHTML !== '&gt;&gt;'){
            button.parentNode.removeChild(button)
            
        }
    })
     // Vaciamos el array de buttons para añadir los nuevos
    buttons = []

    addNewButtons()

}

const addNewButtons = () => {

    // Iteramos la cantidad de botones que tiene que tener la paginación
    for (let index = 1; index <= indexRanges.length; index++) {
                    
        const button = document.createElement('button')
        button.classList.add('pagination-rooms__button')
        button.classList.add('button')
        button.classList.add('button--pagination')
        button.innerHTML = index

        if(index == 1){
            button.classList.add('button--pagination--active')
            activePage = button
        }
        
        buttonLast.parentNode.insertBefore(button,buttonLast)
        buttons.push(button)

    }
}

const changePageRoom = (number) => {

    activePage.classList.remove('button--pagination--active')
    activePage = paginationElement.children[number]
    activePage.classList.add('button--pagination--active')

    buttonLast.classList.remove('button--pagination--inactive')
    buttonLast.disabled = false

    if(number === 1){
        buttonFirst.classList.add('button--pagination--inactive')
        buttonFirst.disabled = true

        buttonLast.classList.remove('button--pagination--inactive')
        buttonFirst.disabled = false
    }
    else if (number === indexRanges.length){
        buttonFirst.classList.remove('button--pagination--inactive')
        buttonFirst.disabled = false

        buttonLast.classList.add('button--pagination--inactive')
        buttonLast.disabled = true
    }
    else {
        buttonFirst.classList.remove('button--pagination--inactive')
        buttonFirst.disabled = false

        buttonLast.classList.remove('button--pagination--inactive')
        buttonLast.disabled = false
    }

    updateRoomList(number)
}


buttonFirst.addEventListener('click', () => {
    changePageRoom(1)
})
buttonLast.addEventListener('click', () => {

    changePageRoom(indexRanges.length)
})



