<template>
    <ul v-if="actions" class=" " @mouseout="hovered = false">
        <li class="ellipsis-menu">
            <a href="#" @mouseover="hovered = true">
                <i class="fas fa-ellipsis-h"></i>
            </a>
            <ul v-show="hovered" class="ellipsis-dropdown"  @mouseover="hovered = true">
                <li v-for="action in displayActions" >
                    <delete-button
                        v-if="action.type === 'delete'"
                        :action="action.url"
                        :icon="action.icon"
                    ></delete-button>
                    <template v-else-if="action.type === 'menu'">
                        <a href="#">
                            <i :class="action.icon"></i>
                            <span>{{ action.label }}</span>
                        </a>
                        <ul >
                            <li v-for="nestedAction in action.actions">
                                <form
                                    v-if="nestedAction.type === 'post'"
                                    :action="nestedAction.url"
                                    method="post"
                                >
                                    <input type="hidden" name="_token" :value="csrf" />
                                    <input
                                        type="hidden"
                                        :name="nestedAction.name"
                                        :value="nestedAction.value"
                                    />
                                    <button type="submit">
                                        <i :class="nestedAction.icon"></i>
                                        <span>{{ nestedAction.label }}</span>
                                    </button>
                                </form>
                                
                                <a v-else :href="nestedAction.url">
                                    <i :class="nestedAction.icon"></i>
                                    <span>{{ nestedAction.label }}</span>
                                </a>
                            </li>
                        </ul>
                    </template>
                    <form v-else-if="action.type === 'post'" :action="action.url" method="post">
                        <input type="hidden" name="_token" :value="csrf" />
                        <input type="hidden" :name="action.name" :value="action.value" />
                        <button type="submit" class="button">
                            <i :class="action.icon"></i>
                            <span>{{ action.label }}</span>
                        </button>
                    </form>
                    <a v-else 
                    :class="action.class"
                    :href="action.url">
                        <i :class="action.icon"></i>
                        <span>{{ action.label }}</span>
                    </a>
                </li>
            </ul>
        </li>
    </ul>
</template>

<script>
    import DeleteButton from "./DeleteButton";

    export default {
        name: "EllipsisMenu",
        components: {
            "delete-button": DeleteButton
        },
        props: ["actions"],
        data() {
            return {
                hovered: false,
            }
        },
        computed: {
            displayActions() {
                return this.actions.filter(action => {
                    return !action.hidden;
                });
            }
        },
        // mounted() {
        //     $(this.$el).foundation();
        // },
        // destroyed() {
        //     $(this.$el).foundation("_destroy");
        // }
    };
</script>