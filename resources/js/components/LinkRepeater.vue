<template>
  <div>
        <div class="is-flex is-justify-content-space-between is-align-items-center mb-3">
            <label class="label">Links {{ inputRows.length }}</label> 
            <button @click.stop.prevent="addRow" class="button is-light">+</button>
        </div>
        <template v-for="(row, index) in inputRows">
            <div class="is-flex is-justify-content-space-between is-align-items-center mb-3">
                <div class="field">
                    <label class="label" :for="`link_name[${index}]`">Name {{index}}</label>
                    <div class="control">
                        <input class="input" type="text" :name="`link_name[${index}]`" v-model="row.name"/>
                    </div>
                 </div>
                <div class="field">
                    <label class="label" :for="`link_url[${index}]`">Url</label>
                    <div class="control"> 
                        <input class="input" type="url" :name="`link_url[${index}]`" v-model="row.url"/>
                    </div>
                </div>
                <div class="control">
                    <button @click.stop.prevent="removeRow(row)" class="button is-light">x</button>
                </div>
            </div>
        </template>
      <!--  -->
  </div>
</template>

<script>
export default {
    // Need props to bring in the saved data for links
    props:{
        links: {
            type: Object,
            default: null,
         }
    },
    data(){
        return {
            inputRows : [],
        }
    },
    created(){
        this.getSavedLinks();
    },
    methods: {
        getSavedLinks(){
            if(this.links){
                this.inputRows = Array.from(this.links.links).map(link => {
                    return       {
                        name: link.name,
                        url: link.url,
                    }
                });
            }
        },
        addRow(){
            //if there is more than 1 input row, check if the previous row is filled out
            let validated = true;
            let message = "";
            if(this.inputRows.length){
                if(this.inputRows[this.inputRows.length - 1].name === ''){
                    validated = false;
                    message = "A link name is required";
                }
                else if(this.inputRows[this.inputRows.length - 1].name.length < 3){
                    validated = false;
                    message = "A link name must be greater than 2 characters";
                }
                else if(this.inputRows[this.inputRows.length - 1].url === ''){
                    validated = false;
                    message = "A link url is required";
                }
            }

            if(validated){
                this.inputRows.push(
                    {
                        name: '',
                        url: '',
                    }
                )
            } else {
                alert(message);
            }
        },
        removeRow(row){
            this.inputRows.splice(row, 1);
         }
    }
}
</script>

 