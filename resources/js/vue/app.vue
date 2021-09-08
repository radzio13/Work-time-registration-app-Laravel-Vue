<template>
    <div class="workTime">
        <div class="heading">
            <h2 id="title">System rejestracji czasu pracy</h2>
                <work-add v-on:reloadlist="getList()" />
                <input type="text" v-model="search" placeholder="Wpisz datę szukanego zadania (np. 2021-09-08)"/>
                <button @click="clear()" class="btn btn-primary">Wyczyść</button>
        </div>
        <work-list :works="works" v-on:reloadlist="getList()" />
    </div>
</template>

<script>
import WorkAdd from './workAdd.vue'
import WorkList from './workList.vue'

export default {
    components: {
        WorkList,
        WorkAdd
    },
    data: function() {
        return {
            works: [],
            search: ''
        }
    },
    
    methods: {
        getList() {
            axios.get('/works')
            .then(response => {
                this.works = response.data
            })
            .catch(error => {
                console.log(error);
            })
        },
        searchdata(value) {
            axios.get('/work/search/' + value)
            .then(response => {
                this.works = response.data;
            })
            .catch(error => {
                console.log(error);
            })
        },
        clear() {
            this.search = "";
            this.getList();
        }
    },
    watch: {
        search () {
            this.searchdata(this.search);
        }
    },
    created() {
        this.getList();
    }
    
}
</script>

<style scoped>
.workTime {
    width: auto;
    margin: 5px;
}

.heading {
    background: #e6e6e6;
    padding: 10px;
}

#title {
    text-align: center;
}

input {
    background: #f7f7f7;
    border: 0px;
    outline: none;
    padding: 5px;
    margin-right: 10px;
    margin-top: 20px;
    width: 30%;
  }
</style>