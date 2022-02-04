import jQuery from "jquery";  
import "./includes/Editor";
import LightBoxTrigger from './includes/LightBoxTrigger';

jQuery(document).ready(function($){

    $('.image-tool__image').each((id, el)=>{
        $(el).data('images-class', "image-tool__image-picture");
        $(el).data('caption-class', "image-tool__caption");

        $(el).on('click', (ev)=>{
            ev.preventDefault();
            let lboxTrigger = new LightBoxTrigger($(el), "src", id);
            // console.log({lbox})
        })

    });
});


/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue').default;

import VueCookies from 'vue-cookies'
Vue.use(VueCookies);
Vue.$cookies.config(0, '/');


if(Vue.$cookies.get("isOpened") === null){
    console.log("reached is null check")
    Vue.$cookies.set("isOpened", true);
}

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

Vue.component('counter', require('./components/Counter.vue').default);
Vue.component('message-display', require('./components/MessageDisplay.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */
if(document.getElementById('app')){
     const app = new Vue({
        el: '#app',
    });
}

