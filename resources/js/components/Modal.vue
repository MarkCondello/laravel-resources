<template>
    <div v-if="isOpen" id="modal" class="reveal" data-reveal>
        <h5 class="title">{{ title }}</h5>
        <div class="message" v-html="message"></div>
        <slot></slot>
        <v-form v-if="formData"
                :action="formData.action"
                :method="formData.method"
                :fields="formData.fields"
                :values="formData.values"
                :submit="false"
                :event-bus="formModalEventBus"
                @saved="onFormSave"
        ></v-form>
        <div class="button-line space-between">
            <button v-if="actionText"
                    type="button"
                    class="button"
                    :class="actionClass"
                    @click="onAction"
            >
                <span>{{ actionText }}</span>
            </button>
            <button v-if="cancelText"
                    type="button"
                    class="button"
                    :class="cancelClass"
                    @click="onCancel"
            >
                <span>{{ cancelText }}</span>
            </button>
        </div>
        <button class="close-button"
                type="button"
                aria-label="Close modal"
                @click="onClose"
        >
            <span aria-hidden="true">
                <i class="fal fa-times"></i>
            </span>
        </button>
    </div>
</template>

<script>
    import Vue from 'vue';

    export default {
        name: "Modal",
        props: {
            bus: {
                type: Object,
                required: false,
            },
        },
        data() {
            return {
                title: 'Attention',
                message: 'Are you sure?',
                actionText: 'Confirm',
                cancelText: 'Cancel',
                actionClass: 'button',
                cancelClass: 'button hollow',
                actionCallback: null,
                cancelCallback: null,
                modal: null,
                isOpen: false,
                formData: null,
                formModalEventBus: new Vue(),
            }
        },
        mounted() {
            /*
             * Use the event bus (bus) passed in from component parent, otherwise use the global event bus (eventBus). 
             */
            // if (this.bus) {
            //     this.eventBus = this.bus;
            // }
            this.eventBus.$on("modalOpen", data => this.onOpen(data));
            this.eventBus.$on('modalClose', this.onClose);
        },
        methods: {
            onOpen(data) {
                console.log("reached onOpen in Modal")
                if (data) {
                    this.setData(data);
                }
                this.open();
            },
            onClose() {
                this.close();
            },
            onAction() {
                if (this.actionCallback) {
                    this.actionCallback();
                }
                this.eventBus.$emit('modalAction');
            },
            onCancel() {
                this.close();
                if (this.cancelCallback) {
                    this.cancelCallback();
                }
                this.eventBus.$emit('modalCancel');
            },
            onFormSave() {
                this.onAction();
            },
            setData(data) {
                this.title = data.title ? data.title : null;
                this.message = data.message ? data.message : null;
                this.actionText = data.actionText ? data.actionText : null;
                this.cancelText = data.cancelText ? data.cancelText : null;
                this.actionClass = data.actionClass ? data.actionClass : null;
                this.cancelClass = data.cancelClass ? data.cancelClass : null;
                this.actionCallback = data.actionCallback ? data.actionCallback : null;
                this.cancelCallback = data.cancelCallback ? data.cancelCallback : null;

                if (data.formData) {
                    this.formData = {
                        action: data.formData.action,
                        method: data.formData.method,
                        fields: data.formData.fields,
                        values: data.formData.values,
                    };
                } else {
                    this.formData = null;
                }
            },
            open() {
                this.isOpen = true;
                setTimeout(() => {
                    // this.modal = $(this.$el).foundation();
                    // this.modal.foundation('open').on('closed.zf.reveal', () => { this.close() });
                }, 1);
            },
            close() {
                this.isOpen = false;
                // this.modal.foundation('_destroy');
            },
        },
    }
</script>
