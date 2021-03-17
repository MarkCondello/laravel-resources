import './includes/Editor';

import FlashMessage from './components/FlashMessage.js';
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.addEventListener('load', ()=>{
   let flashMessages = Array.from(document.querySelectorAll(".flash-message"));

  flashMessages.forEach(el=>{
    new FlashMessage(el);
  });
 
});


window.Vue = require('vue').default;

Vue.prototype.eventBus = new Vue();

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component('search-sort-table', require('./components/SearchSortTable.vue').default);
Vue.component('modal', require('./components/Modal.vue').default);
Vue.component('link-repeater', require('./components/LinkRepeater.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
    data(){
        return {
          csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
        }
    }
});
