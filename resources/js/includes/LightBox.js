class LightBox {
    constructor(el){
        this.container = el;
        this.topBtns = this.container.querySelectorAll('button');
        this.expandCompressBtn = this.topBtns[0];
        this.expandCompressBtnIcon = this.expandCompressBtn.querySelector('i');
        this.expandIcon = this.expandCompressBtnIcon.classList.value;
        this.contractIcon = "fal fa-compress-alt";
        this.closeBtn = this.topBtns[1];
        this.previewArea = this.container.querySelector('figure');
        this.captionArea = this.previewArea.querySelector('figcaption');
        this.nav = this.container.querySelector('nav');
        this.prevNextBtns = this.nav.querySelectorAll('button');
        this.prevBtn = this.prevNextBtns[0];
        this.nextBtn = this.prevNextBtns[1];
    }
} 

let addLightBoxTemplate = (dataId) => {
    let body = document.querySelector('body'),
    template = `<div data-${dataId} class="lightbox">
    <button><i class="fas fa-expand-alt"></i></button>
    <button><i class="fas fa-times"></i></button> 
    <figure>
        <figcaption></figcaption>
    </figure>
    <nav>
        <button>
            <i class="fas fa-chevron-left"></i>
        </button>     
        <button>
            <i class="fas fa-chevron-right"></i>
        </button>
    </nav>
    </div>`;
    body.insertAdjacentHTML("beforeend", template);
    return
}

export {LightBox, addLightBoxTemplate}