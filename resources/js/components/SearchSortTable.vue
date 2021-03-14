<template>
    <div class="search-sort-table" :class="cssClass">
        <div class="header">
            <div class="title">
                <h5>{{ items.length }} Results</h5>
            </div>
            <div class="actions">
                <slot name="actions"></slot>
            </div>
        </div>
        <transition name="fade">
            <div v-if="loading" class="loading">
                <div class="spinner">
                    <i class="fal fa-spinner fa-spin fa-4x"></i>
                </div>
            </div>
        </transition>
        <table v-if="items && items.length > 0">
            <thead>
                <tr>
                    <th
                        v-for="column in columns"
                        @click="column.sortable ? sortColumn(column.name) : null"
                        :class="(column.sortable ? 'sortable' : '') + (column.align ? ' align-' + column.align : '')"
                    >
                        <span>{{ column.label }}</span>
                        <i
                            v-if="column.name === sort"
                            :class="'fal fa-long-arrow-'+ (dir === 'desc' ? 'up' : 'down')"
                        ></i>
                    </th>
                    <th>&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <tr
                    v-for="item in items"
                    :class="{toggled : item.toggleGroupItemClicked, show : itemGetShowAction(item)}"
                    :style="item.color ? 'border-left: 8px solid' + item.color : '', item.toggle ? 'display:none' : '' "
                >
                    <td
                        v-for="column in columns"
                        @click="onCellClick(item, column)"
                        :data-header="column.label"
                        :class="(column.align ? 'align-' + column.align : '') + (column.editable ? ' editable' : '')"
                    >
                        <span :class="columnStyle(column, item)">
                            <span v-if="typeof item[column.name] === 'boolean'">
                                <span v-if="item[column.name]">
                                    <span class="boolean-cell-true">
                                        <i class="fal fa-check"></i>
                                    </span>
                                </span>
                                <span v-else>
                                    <span class="boolean-cell-false">
                                        <i class="fal fa-times"></i>
                                    </span>
                                </span>
                            </span>
                            <span  v-else>{{ item[column.name] }}</span>
                        </span>
                    </td>
                    <td
                        v-if="item.actions && item.actions.filter(action => { return !action.hidden; }).length"
                        class="actions-cell"
                    >
                        <div class="actions">
                            <ellipsis-menu :actions="item.actions"></ellipsis-menu>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <div v-else class="no-items">
            <p>
                <i class="fal fa-empty-set fa-2x"></i>
            </p>
            <p>There are no items available.</p>
        </div>
        <nav aria-label="pagination" v-if="pagination && pagination.last_page > 1">
            <ul class="pagination text-center">
                <li
                    v-if="pagination.current_page !== 1"
                    @click="setPage(pagination.current_page - 1)"
                >
                    <button type="button">
                        <i class="fal fa-arrow-left"></i>
                    </button>
                </li>
                <li
                    v-for="page in pagination.last_page"
                    @click="setPage(page)"
                    :class="{'current': pagination.current_page === page}"
                >
                    <button type="button">{{ page }}</button>
                </li>
                <li
                    v-if="pagination.current_page !== pagination.last_page"
                    @click="setPage(pagination.current_page + 1)"
                >
                    <button type="button">
                        <i class="fal fa-arrow-right"></i>
                    </button>
                </li>
            </ul>
        </nav>
    </div>
</template>

<script>
    import axios from "axios";
    import EllipsisMenu from "./EllipsisMenu";

    export default {
        name: "SearchSortTable",
        components: {
             "ellipsis-menu": EllipsisMenu
        },
        props: {
            title: String,
            cssClass: String,
            url: {
                type: String,
                required: true
            },
            columns: {
                type: Array,
                required: true
            },
            query: {
                page: String,
                vsearch: String,
                sort: String,
                dir: String
            }
        },
        data() {
            return {
                items: [],
                loading: false,
                vsearch: null,
                search: null,
                page: 1,
                sort: null,
                dir: null,
                startDate: null,
                endDate: null,
                pagination: null
            };
        },
        created() {
            if (this.query) {
                this.page = this.query.page ? this.query.page : this.page;
                this.vsearch = this.query.vsearch
                    ? this.query.vsearch
                    : this.vsearch;
                this.sort = this.query.sort ? this.query.sort : this.sort;
                this.dir = this.query.dir ? this.query.dir : this.dir;
            }
            this.getData();
            this.eventBus.$on("vSearchInputChange", vsearch => {
                this.page = 1;
                this.vsearch = vsearch ? vsearch : null;
                this.getData();
            });

            this.eventBus.$on("searchInputChange", search => {
                this.page = 1;
                this.search = search ? search : null;
                this.getData();
            });

            this.eventBus.$on("datePickerInputChange", date => {
                if (date) {
                    this.startDate = date.start ? date.start : null;
                    this.endDate = date.end ? date.end : null;
                } else {
                    this.startDate = null;
                    this.endDate = null;
                }
                this.getData();
            });
            this.getData = _.debounce(this.getData, 200);
        },
        methods: {
            columnStyle(column, item = null) {
                let style = "";
                if (column.style) {
                    style += column.style;
                }
                if (column.label_style && item) {
                    style += " " + column.label_style[item[column.name]];
                }
                return style;
            },
            getData() {
                this.loading = true;
                axios
                    .get(this.url, {
                        params: {
                            vsearch: this.vsearch,
                            search: this.search,
                            start_date: this.startDate,
                            end_date: this.endDate,
                            dir: this.dir,

                            page: this.page,
                            sort: this.sort, //ToDo: do the sorting
                        }
                    })
                    .then(res => {
                        this.vsearch = res.config.params
                            ? res.config.params.vsearch
                            : this.vsearch;

                        this.search = res.config.params
                            ? res.config.params.search
                            : this.search;

                        this.sort = res.config.params
                            ? res.config.params.sort
                            : this.sort;
                        this.dir = res.config.params
                            ? res.config.params.dir
                            : this.dir;
                        this.items = res.data.data.map(item => {
                            item.toggle = false;
                            item.toggleGroupItemClicked = false;
                            return item;
                        });

                         this.pagination = res.data.meta;
                    })
                    .catch(console.error)
                    .finally(() => {
                        this.loading = false;
                    });
            },
            setPage(page) {
                this.page = page;
                this.getData();
            },
            sortColumn(name) {
                if (this.sort === name) {
                    if (this.dir === "asc") {
                        this.dir = "desc";
                    } else if (this.dir === "desc") {
                        this.dir = "asc";
                    }
                } else {
                    this.dir = "asc";
                }
                this.sort = name;
                this.getData();
            },
            itemGetShowAction(item) {
                if (!item.actions) {
                    return null;
                }
                return item.actions.find(action => {
                    return action.type === "show";
                });
            },
            onCellClick(item, column) {
                if (column.editable) {
                    if (item.actions.length > 0) {
                        let action = item.actions.find(action => {
                            return action.type === column.edit_action;
                        });
                        if (action) {
                            if (column.type === "boolean") {
                                item[column.name] = !item[column.name];
                                axios.put(action.url, item).catch(console.error);
                            }
                        }
                    }
                } else {
                    let showAction = this.itemGetShowAction(item);
                    if (showAction) {
                        window.location = showAction.url;
                    }
                }
            }
        }
    };
</script>

<style scoped>
.fade-enter-active {
    transition: opacity 50ms;
}

.fade-leave-active {
    transition: opacity 200ms;
}

.fade-enter,
.fade-leave-to {
    opacity: 0;
}
</style>