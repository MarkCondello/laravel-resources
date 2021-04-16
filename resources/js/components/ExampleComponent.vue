<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Example Component</div>

                    <div class="card-body" v-if="opened">
                        I'm an example component opened.
                    </div>
                     <div class="card-body" v-else>
                        I'm an example component closed.
                    </div>
                    <button @click="handleToggle">Toggle Open val</button>
                    <!-- ToDo: Create a toggle button for the open data val -->
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {

        data(){
            return {
                opened: null,
            }
        },
        mounted() {
            this.opened = this.$cookies.get("isOpened") === "true";
        },
        methods: {
            handleToggle(){
                this.opened = !this.opened;
                this.$cookies.set("isOpened", this.opened)
            }
        }
    }
</script>
