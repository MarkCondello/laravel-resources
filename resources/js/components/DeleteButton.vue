<template>
    <form :action="action"
        method="post"
        ref="deleteForm"
        >
        <input type="hidden" name="_token" :value="this.$root._data.csrf">
        <input type="hidden" name="_method" value="delete">
        <button 
            class="button is-danger"
            type="button"
            @click="click">
                <i :class="icon"></i>
                <span>Delete</span>
        </button>
    </form>
 </template>
 
 <script>
 export default {
 
 }
 </script>
 
 <style>
 
 </style>
<script>
    import Modal from './Modal';

    export default {
        name: "DeleteButton",
        components: {
            'modal': Modal,
        },
        props: {
            action: {
                type: String,
                required: true,
            },
            icon: String,
        },
        
        methods: {
            click() {
                console.log("reached click")
                this.eventBus.$emit('modalOpen', {
                    title: 'Delete?',
                    message: 'Are you sure you want to delete this item?',
                    actionText: 'Yes, delete',
                    actionClass: 'is-danger',
                    actionCallback: this.doDelete,
                    cancelText: "No, exit"
                });
            },
            doDelete() {
                // ref would be better than jQuery
                console.log(this.$refs)
                this.$refs.deleteForm.submit();
            },
        },
    }
</script>