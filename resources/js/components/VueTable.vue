<template>
  <div class="vue-table">
    <transition name="fade">
      <div v-if="loading" class="loading">
          <div class="spinner">
              <i class="fas fa-spinner fa-spin fa-4x"></i>
          </div>
      </div>
    </transition>
    <table v-if="table_ths && table_ths.length && table_rows && table_rows.length">
       <thead>
        <tr>
          <th
            v-for="th in table_ths"
            :class="(th.sortable ? 'sortable' : null)"
            :key="th.key"
          >
            <button v-if="th.sortable" @click="sortColumn(th.key)">
              <span>{{ th.label }}</span>
              <span v-if="th.key === sort"
                :class="'fal fa-long-arrow-' + (dir === 'desc' ? 'up' : 'down')">
                {{ (dir === 'desc' ? 'up' : 'down') }}
                </span>
            </button>
            <template v-else>
            {{ th.label }}
            </template>
          </th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(tr, id) in table_rows"
          :key="id"
          >
          <td v-for="td in tr"
          :data-label="td.key"
          >
            <component 
              v-if="getTdType(td.key) === 'Component'"
              v-bind="td.component_data"
              :is="td.component_name"
            ></component>
            <div v-else :data-type="getTdType(td.key)">
             {{ td.value }}
            </div>
           </td>
        </tr>
      </tbody>
    </table>
    <div v-else class="no-items">
      <i class="fal fa-empty-set fa-2x"></i>
      <p>There are no items available.</p>
    </div>
     <nav aria-label="pagination" v-if="table_ths && table_ths.length && pagination && pagination.last_page > 1">
        <ul class="pagination">
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

<script setup>

export default {
  props: {
    table_ths: {
      type: Array,
      required: true,
    },
    dataUrl: {
      type: String,
      required: true,
    },

  },
  data() {
    return {
      loading: false,
      table_rows: null,
      page: 1,
      sort: null,
      dir: null,
      pagination: null,
    }
  },
  created() {
    this.getData();
  },
  methods: {
    getData(params = {}) {
      this.loading = true;
      console.log('getData', {params})
      axios
        .get(this.dataUrl, {params})
        .then(res => {
          console.log('res', res)
          // this.table_ths = res.data.table_ths
          this.table_rows = res.data.data
            // this.search = res.config.params
            //     ? res.config.params.search
            //     : this.search;

          this.pagination = res.data.meta;
        })
        .catch(console.error)
        .finally(() => {
            this.loading = false;
        });
    },
    getTdType(key) {
      return this.table_ths.find(th => th.key === key).type
    },
    setPage(page) {
        this.page = page;
        this.getData({page: this.page});
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
        this.getData({sort: this.sort, dir: this.dir});
    },
  }
  


}
</script>

 