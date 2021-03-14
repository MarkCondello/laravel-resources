<template>
    <ul v-if="actions" class="vertical dropdown menu" data-dropdown-menu data-closing-time="2">
        <li class="is-dropdown-submenu-parent">
            <a href="#">
                <i class="fal fa-ellipsis-h"></i>
            </a>
            <ul class="menu">
                <li v-for="action in displayActions">
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
                        <ul class="menu">
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
                        <button type="submit">
                            <i :class="action.icon"></i>
                            <span>{{ action.label }}</span>
                        </button>
                    </form>
                    <a v-else :href="action.url">
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