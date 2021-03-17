export default class {
    constructor(el){
        this.flashMessage = el;
        this.closeButton = this.flashMessage.querySelector('button.delete');
 
        this.closeButton.addEventListener('click', event => {
            this.fadeFlashMessage();
        });

        setTimeout(()=>{
            this.fadeFlashMessage();
        }, 3000);
    }
    fadeFlashMessage(){
        this.flashMessage.classList.add("fade");
        setTimeout(()=>{
            this.flashMessage.style.display = "none";
        }, 1000);
    }
}