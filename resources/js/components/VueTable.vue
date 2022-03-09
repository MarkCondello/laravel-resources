<template>
  <div class="vue-table">
     <!-- Will need a portal to position search anywhere we want https://portal-vue.linusb.org/ -->
      <header v-if="searchBy">
        <i class="fas fa-search"></i>
        <label><span>Search table</span>
          <input type="search" v-model="search" @input="handleSearch" :placeholder="`Search by ${searchBy}.`">
        </label>
      </header>
       <transition name="fade">
        <div v-if="no_results" class="no-items">
          <i class="fa fa-empty-set fa-2x"></i>
          <p>There are no items available.</p>
        </div>
       </transition>
      <transition name="fade">
        <div v-if="loading" class="loading">
            <div class="spinner">
                <i class="fas fa-spinner fa-spin"></i>
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
                  :class="'fa fa-arrow-' + (dir === 'desc' ? 'up' : 'down')">
                  <!-- {{ (dir === 'desc' ? 'up' : 'down') }} -->
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
      <nav class="pagination" aria-label="pagination" v-if="table_ths && table_ths.length && pagination && pagination.last_page > 1">
          <ul >
              <li
                  v-if="pagination.current_page !== 1"
                  @click="setPage(pagination.current_page - 1)"
              >
                  <button type="button">
                      <i class="fa fa-arrow-left"></i>
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
                      <i class="fa fa-arrow-right"></i>
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
    searchBy: {
      type: String,
      default: null,
    }
  },
  data() {
    return {
      loading: false,
      table_rows: [],
      page: 1,
      sort: null,
      dir: null,
      pagination: null,
      search: null,
      no_results: false,
    }
  },
  created() {
    this.getData();
  },
  methods: {
    getData(params = {}) {
      this.loading = true;
      // console.log('getData', {params})
      axios
        .get(this.dataUrl, {params})
        .then(res => {
          this.table_rows = res.data.data; 
          // attach a reference to the column for the td el
          // add in other attributes as well eg classes, styles, data-attrs
          // check Lees widget and the article class for details
          this.pagination = res.data.meta;
        })
        .catch(console.error)
        .finally(() => {
          this.no_results = this.table_rows.length < 1
          this.loading = false
        })
    },
    getTdType(key) {
      return this.table_ths.find(th => th.key === key).type
    },
    setPage(page) {
        this.page = page
        const params = { page }
        if(this.dir && this.sort) {
          params.dir = this.dir
          params.sort = this.sort
        }
        this.getData(params)
    },
    sortColumn(name) {
        if (this.sort === name) {
            if (this.dir === "asc") {
                this.dir = "desc"
            } else if (this.dir === "desc") {
                this.dir = "asc"
            }
        } else {
            this.dir = "asc"
        }
        this.sort = name;
        this.getData({sort: this.sort, dir: this.dir, page: this.page});
    },
    handleSearch() {
      const searchTimeout = setTimeout(()=> {
        this.getData({search: this.search, search_by: this.searchBy})
        clearTimeout(searchTimeout)
      }, 500)
    }
  }
}
</script>

 