import {addLightBoxTemplate, LightBox} from './LightBox';

export default class LightBoxTrigger{
    constructor($trigger,  src = "src", index = 0){
        addLightBoxTemplate('lbox-js-template');

        this.lightboxTemplate = document.querySelector('[data-lbox-js-template]');
        this.lightBox = new LightBox(this.lightboxTemplate);
        this.$trigger = $trigger;
        this.imagesClass = this.$trigger.data('images-class');
        this.images = [];
        this.captionsClass = this.$trigger.data('caption-class');
        this.captions = [];
        this.imgSrcAttribute = src; // the image src item may be an anchor which would require a href attribute
        this.currentIndex = index;
        this.expandPreviewArea = false;
        this.lightBox.expandCompressBtn.addEventListener('click', (ev)=>{
            ev.preventDefault();
            this.handleExpandContractClick();
        });
        this.lightBox.closeBtn.addEventListener('click', (ev)=>{
            ev.preventDefault();
            this.close();
        }); 
        this.lightBox.nextBtn.addEventListener('click', (ev)=>{
            ev.preventDefault();
            this.handleNextClick();
        });
        this.lightBox.prevBtn.addEventListener('click', (ev)=>{
            ev.preventDefault()
            this.handlePrevClick();
        });
        document.addEventListener('keydown', (ev)=>{
            if(ev.key === "Escape"){
                this.close();
            }
        });
        if(this.imgSrcAttribute === 'href'){
            this.lightBox.expandCompressBtn.style.display = 'none';
            this.lightBox.previewArea.addEventListener('click', (ev)=>{
                window.open( this.images[this.currentIndex].href,'_blank');
            });
        }
        this.display();
    }
    handleExpandContractClick(){
        this.lightBox.expandCompressBtnIcon.className = '';
        if(!this.expandPreviewArea){
            this.lightBox.expandCompressBtnIcon.className = this.lightBox.contractIcon;
            this.expandPreviewArea = true;
            this.updateSlide();
            return;
        }
        this.lightBox.expandCompressBtnIcon.className = this.lightBox.expandIcon;
        this.expandPreviewArea = false;
        this.updateSlide();
    }
    handlePrevClick(){
        if(this.currentIndex === 0){
            this.currentIndex = this.images.length - 1;
        } else {
            this.currentIndex--;
        }
        this.updateSlide();
    }
    handleNextClick(){
        if(this.currentIndex === this.images.length - 1){
            this.currentIndex = 0;
        } else {
            this.currentIndex++;
        }
        this.updateSlide();
    }
    display(){
        this.images = Array.from(document.querySelectorAll(`.${this.imagesClass}`));
        if(this.captionsClass != null){
            this.captions = Array.from(document.querySelectorAll(`.${this.captionsClass}`));
        }
        this.lightBox.container.classList.add('show');
        this.updateSlide();
    }
    updateSlide(){
        // console.log({currentIndex: this.currentIndex, captionEl: this.captions[this.currentIndex], captionText: this.captions[this.currentIndex].innerText}, )
        let imgSrc = null;
        if(this.captions.length && this.captions[this.currentIndex].innerText !== undefined){
            this.lightBox.captionArea.innerText = this.captions[this.currentIndex].innerText;
        } else {
            if(this.images[this.currentIndex].alt && this.captions.length === 0){
                this.lightBox.captionArea.innerText = this.images[this.currentIndex].alt;
            } else {
                this.lightBox.captionArea.innerText = 'No caption included.';
            }
        }
        if(this.imgSrcAttribute === 'src'){
            imgSrc = this.images[this.currentIndex].src;

        } else if (this.imgSrcAttribute === 'href'){
            imgSrc = this.images[this.currentIndex].href;
        }
        this.lightBox.previewArea.style.backgroundImage = `url(${imgSrc})`;
        if(this.expandPreviewArea){
            let imgWidth = this.images[this.currentIndex].naturalWidth,
            imgHeight = this.images[this.currentIndex].naturalHeight;
            if(this.lightBox.previewArea.offsetHeight < imgHeight && this.lightBox.previewArea.offsetWidth < imgWidth){   
                this.lightBox.previewArea.style.width = imgWidth + "px";
                this.lightBox.previewArea.style.height = imgHeight + "px";
                return;
            }
            this.expandPreviewArea = false;
            this.lightBox.expandCompressBtnIcon.className = this.lightBox.expandIcon; // if the image is smaller than the preview window, set the expanded option to false
             alert("This image is too small for fullscreen view.")
        }
        this.lightBox.previewArea.style.width = null;
        this.lightBox.previewArea.style.height = null;
    }
    close(){
        this.lightBox.container.classList.remove('show');
        this.currentIndex = 0;
        this.expandPreviewArea = false;
        this.images = [];
        this.lightBox.captionArea.innerText = '';
        this.lightBox.expandCompressBtn.style.display = null;
        this.imgSrcAttribute = "src";
        this.lightboxTemplate.remove();
    }
}