<template>
    <div class="workTime">
        <div class="heading">
            <h2 id="title">System rejestracji czasu pracy</h2>
                <work-add v-on:reloadlist="getList()" />
                <div class="searchFieldsContainer">
                    <span>Wyszukiwanie wpisów w danym dniu, miesiącu, roku:</span><br/>
                    <input type="text" v-model="search_date" placeholder="Wpisz datę szukanego zadania (np. '2021-09-08' lub '2021-09' lub '2021' itd)"/>
                    <button @click="clearSearchData()" class="btn btn-info">Wyczyść</button>
                </div>
                <br/>
                <div >
                    <span>Wyszukiwanie wpisów według zakresu dat:</span><br/>
                    <input type="text" v-model="search_date_from" placeholder="Od (np. '2020-01-01')"/>
                    <span id="dateSep">-</span>
                    <input type="text" v-model="search_date_to" placeholder="Do (np. '2021-06-01')"/>
                    <button @click="searchRange()" class="btn btn-primary">Szukaj</button>
                    <button @click="clearSearchDataRange()" class="btn btn-info">Wyczyść</button>
                </div>
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
            search_date: '',
            search_date_from: '',
            search_date_to: ''
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
        searchData(date) {
            if(this.search_date.length > 0)
            {
                axios.get('/work/search/' + date)
                .then(response => {
                    this.works = response.data;
                })
                .catch(error => {
                    console.log(error);
                })
            }
        },
        searchDataRange(date, date2) {
            if(this.search_date_from.length > 0 && this.search_date_to.length > 0)
            {
                axios.get('/work/search/' + date + '/' + date2)
                .then(response => {
                    this.works = response.data;
                })
                .catch(error => {
                    console.log(error);
                })
            }
        },
        clearSearchData() {
            this.search_date = "";
            this.getList();
        },
        clearSearchDataRange() {
            this.search_date_from = "";
            this.search_date_to = "";
            this.getList();
        },
        searchRange () {
            this.searchDataRange(this.search_date_from, this.search_date_to);
        }
    },
    watch: {
        search_date () {
            this.searchData(this.search_date);
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
    width: 30%;
  } 
.searchFieldsContainer {
    margin-top: 20px;
}

#dateSep {
    margin-right: 10px;
}


</style>